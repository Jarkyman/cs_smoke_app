import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    //Sound skal ligge under android/app/main/res/raw/
    //Sound skal ligge under Runner/Resources/
    const String _sound = 'Sound name'; //Do not include .wav on android
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'Util Master',
        'News',
        channelDescription: 'Get news and keep up with the game.',
        importance: Importance.max,
        //sound: RawResourceAndroidNotificationSound(_sound),
      ),
      iOS: DarwinNotificationDetails(
          //sound: _sound,
          ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    print('Notification init');
    final androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOSSettings = DarwinInitializationSettings();

    //If the app is closed
    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.notificationResponse!.payload);
    }

    final settings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        onNotifications.add(payload.payload);
      },
    );

    if (initScheduled) {
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  static void showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    DateTime? scheduledDate, //For test only
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        //tz.TZDateTime.from(scheduledDate!, tz.local), //Test only
        _scheduleWeekly(TimeOfDay(hour: 17, minute: 00),
            days: [DateTime.tuesday, DateTime.friday]),
        await _notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

  static tz.TZDateTime _scheduleDaily(TimeOfDay time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, time.hour, time.minute);

    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
  }

  static tz.TZDateTime _scheduleWeekly(TimeOfDay time,
      {required List<int> days}) {
    tz.TZDateTime scheduledDate = _scheduleDaily(time);
    while (!days.contains(scheduledDate.weekday)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }

    return scheduledDate;
  }

  static void cancel(int id) => _notifications.cancel(id);
  static void cancelAll() => _notifications.cancelAll();
}
