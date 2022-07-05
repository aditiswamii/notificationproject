// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // ignore: slash_for_doc_comments
//
// class PushNotificationService {
//   // It is assumed that all messages contain a data field with the key 'type'
//   Future<void> setupInteractedMessage() async {
//     await Firebase.initializeApp();
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Get.toNamed(NOTIFICATIOINS_ROUTE);
//       if (message.data['type'] == 'chat') {
//         // Navigator.pushNamed(context, '/chat',
//         //     arguments: ChatArguments(message));
//       }
//     });
//     await enableIOSNotifications();
//     await registerNotificationListeners();
//   }
//   registerNotificationListeners() async {
//     AndroidNotificationChannel channel = androidNotificationChannel();
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     var androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOSSettings = IOSInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//     );
//     var initSetttings =
//     InitializationSettings(android: androidSettings, iOS: iOSSettings);
//     flutterLocalNotificationsPlugin.initialize(initSetttings,
//         onSelectNotification: (message) async {
//
//         });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
//
//       print(message);
//       RemoteNotification? notification = message!.notification;
//       AndroidNotification? android = message.notification?.android;
//
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               icon: android.smallIcon,
//               playSound: true,
//             ),
//           ),
//         );
//       }
//     });
//   }
//   enableIOSNotifications() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true, // Required to display a heads up notification
//       badge: true,
//       sound: true,
//     );
//   }
//   androidNotificationChannel() => AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     importance: Importance.max,
//   );
// }