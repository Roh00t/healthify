import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
static  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
static final onNotification = BehaviorSubject<String>();

static Future _notificationDetails() async{
  return NotificationDetails(
    android: AndroidNotificationDetails(
      'channal id',
      'channel name',
      'channel description',
      importance: Importance.max,
    ),iOS: IOSNotificationDetails(),
  );
}
static Future init({bool initScheduled = false}) async{
  final android =AndroidInitializationSettings('@mipmap/ic_launcher');
  final iOS = IOSInitializationSettings();
  final settings = InitializationSettings(android: android, iOS: iOS);
  await flutterLocalNotificationsPlugin.initialize(settings,onSelectNotification: (payload) async{
    onNotification.add(payload);
  });
}
static Future showNotification({
  int id = 0,
  String title,
  String body,
  String payload,
}) async =>flutterLocalNotificationsPlugin.show(id, title, body, await _notificationDetails(),payload: payload);

}

