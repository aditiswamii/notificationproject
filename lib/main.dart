import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'messaging_service.dart';



MessagingService _msgService = MessagingService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Link app with Firebase (use FlutterFire CLI tools)
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await _msgService.init();
  runApp(const MyApp());
}

/// Top level function to handle incoming messages when the app is in the background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(" --- background message received ---");
  print(message.notification!.title);
  print(message.notification!.body);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController ctrl = TextEditingController();

  Future _sendMessage() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('metrics-usageStats');
    var func = FirebaseFunctions.instance.httpsCallable("notifySubscribers");
    var res =  await callable.call(<String, dynamic>{
      "targetDevices": [_msgService.token],
      "messageTitle": "Test title",
      "messageBody": ctrl.text
    });

    print("message was ${res.data as bool ? "sent!" : "not sent!"}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Enter your message'),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(height: 50,
                          child: TextField(controller: ctrl))),
                  ElevatedButton(onPressed: _sendMessage
                  ,
                      // _sendMessage,
                      child: const Text("Send"))
                ])));
  }
}
