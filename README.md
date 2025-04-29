# Water Refill Notifier

A Flutter mobile app that allows users to send and receive water refill notifications using Firebase Cloud Messaging (FCM).

## Features

- Persistent foreground notification with a "Notify Friend" button
- Firebase Cloud Messaging for push notifications
- Custom notification actions (Yes/No buttons)
- Sound and vibration for notifications
- Foreground service to keep the app running

## Setup Instructions

1. **Firebase Setup**
   - Create a new Firebase project
   - Add an Android app to your Firebase project
   - Download the `google-services.json` file
   - Replace the placeholder `google-services.json` in `android/app/` with your downloaded file

2. **Dependencies**
   - Run `flutter pub get` to install all dependencies

3. **Android Configuration**
   - Make sure you have the latest Android SDK installed
   - Set up an Android emulator or connect a physical device

## Testing Instructions

1. **On Your Device (Sender)**
   - Install and run the app
   - Grant notification permissions when prompted
   - Note down the FCM token displayed on the screen
   - The app will show a persistent notification with a "Notify Friend" button

2. **On Friend's Device (Receiver)**
   - Install and run the app
   - Grant notification permissions when prompted
   - Note down the FCM token displayed on the screen

3. **Testing the Flow**
   - On your device, tap the "Notify Friend" button
   - Your friend should receive a notification with "Yes" and "No" buttons
   - When your friend taps either button, you should receive a response notification

## Important Notes

- Make sure both devices have an active internet connection
- The app needs to be running in the background to receive notifications
- For testing purposes, you can use the FCM token from the friend's device to send notifications

## Troubleshooting

- If notifications are not received, check the FCM token and internet connection
- Make sure notification permissions are granted
- Check the Android logs for any error messages

## Dependencies

- firebase_core: ^2.24.2
- firebase_messaging: ^14.7.9
- flutter_local_notifications: ^16.3.0
- flutter_foreground_task: ^5.0.0
- permission_handler: ^11.1.0
