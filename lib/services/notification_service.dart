import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSSettings = DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(android: androidSettings, iOS: iOSSettings);

    await _notifications.initialize(initSettings);
    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    await Permission.notification.request();
  }

  Future<void> showPersistentNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'water_refill_channel',
      'Water Refill Notifications',
      channelDescription: 'Notifications for water refill requests',
      importance: Importance.high,
      priority: Priority.high,
      ongoing: true,
      autoCancel: false,
    );

    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(
      1,
      'Water Refill Notifier',
      'Tap to notify your friend',
      platformDetails,
    );
  }

  Future<void> showResponseNotification(String message) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'water_refill_channel',
      'Water Refill Notifications',
      channelDescription: 'Notifications for water refill requests',
      importance: Importance.high,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
      enableVibration: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

    await _notifications.show(
      2,
      'Friend\'s Response',
      message,
      platformDetails,
    );
  }
} 