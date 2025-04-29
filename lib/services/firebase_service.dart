import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  String? _token;

  Future<void> initialize() async {
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    _token = await _messaging.getToken();
    debugPrint('FCM Token: $_token');

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint('Message also contained a notification: ${message.notification}');
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    debugPrint('Got a message whilst in the background!');
    debugPrint('Message data: ${message.data}');
  }

  String? get token => _token;

  Future<void> sendNotification(String targetToken, String message) async {
    // In a real app, you would send this to your backend server
    // which would then use the Firebase Admin SDK to send the notification
    debugPrint('Sending notification to token: $targetToken');
    debugPrint('Message: $message');
  }
} 