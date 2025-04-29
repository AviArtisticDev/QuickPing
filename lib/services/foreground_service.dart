import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class ForegroundService {
  static final ForegroundService _instance = ForegroundService._internal();
  factory ForegroundService() => _instance;
  ForegroundService._internal();

  Future<void> startForegroundTask() async {
    await FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'water_refill_channel',
        channelName: 'Water Refill Notifications',
        channelDescription: 'Notifications for water refill requests',
        channelImportance: NotificationChannelImportance.HIGH,
        priority: NotificationPriority.HIGH,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: true,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );

    await FlutterForegroundTask.startService(
      notificationTitle: 'Water Refill Notifier',
      notificationText: 'Tap to notify your friend',
      callback: startCallback,
    );
  }

  Future<void> stopForegroundTask() async {
    await FlutterForegroundTask.stopService();
  }
}

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(WaterRefillTaskHandler());
}

class WaterRefillTaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp) async {
    // You can use the start callback to initialize resources
  }

  @override
  Future<void> onEvent(DateTime timestamp) async {
    // This is called periodically based on the interval set in ForegroundTaskOptions
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    // You can use the destroy callback to clean up resources
  }
} 