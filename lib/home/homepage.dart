// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
//
//
// class HomePage extends StatefulWidget {
//   HomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _counter = 0;
//  FirebaseMessaging? _firebaseMessaging;
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//
//   @override
//   void initState() {
//     super.initState();
//     var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     var initializationSettingsIOS = IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidRecieveLocalNotification);
//
//     var initializationSettings = new InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
// _firebaseMessaging!.sendMessage();
//
//     // _firebaseMessaging!.configure(
//     //   onMessage: (Map<String, dynamic> message) {
//     //     print('on message ${message}');
//     //     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     //     displayNotification(message);
//     //     // _showItemDialog(message);
//     //   },
//     //   onResume: (Map<String, dynamic> message) {
//     //     print('on resume $message');
//     //   },
//     //   onLaunch: (Map<String, dynamic> message) {
//     //     print('on launch $message');
//     //   },
//
//     // _firebaseMessaging!.requestPermission(
//     //     sound: true, badge: true, alert: true));
//     //
//     //
//     //
//     // _firebaseMessaging?.setForegroundNotificationPresentationOptions().
//     //     .listen((IosNotificationSettings settings) {
//     //   print("Settings registered: $settings");
//     // });
//
//     _firebaseMessaging!.getToken().then((String? token) {
//       assert(token != null);
//       print(token);
//     });
//   }
//
//   Future displayNotification(Map<String, dynamic> message) async{
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'channelid', 'flutterfcm',
//         importance: Importance.max, priority: Priority.high);
//     var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//     var platformChannelSpecifics = new NotificationDetails(
//         android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       message['notification']['title'],
//       message['notification']['body'],
//       platformChannelSpecifics,
//       payload: 'hello',);
//   }
//    void onSelectNotification(String? payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//     await Fluttertoast.showToast(
//         msg: "Notification Clicked",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.black54,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
//     /*Navigator.push(
//       context,
//       new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
//     );*/
//   }
//
// void onDidRecieveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => new CupertinoAlertDialog(
//         title: new Text(title!),
//         content: new Text(body!),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: new Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Fluttertoast.showToast(
//                   msg: "Notification Clicked",
//                   toastLength: Toast.LENGTH_SHORT,
//                   gravity: ToastGravity.BOTTOM,
//                   timeInSecForIosWeb: 1,
//                   backgroundColor: Colors.black54,
//                   textColor: Colors.white,
//                   fontSize: 16.0
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _incrementCounter() {
//     setState(() {
//
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }