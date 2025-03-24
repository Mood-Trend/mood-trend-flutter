import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mood_trend_flutter/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

enum NotificationFrequency {
  daily,
  weekend,
  none,
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  static const String _notificationFrequencyKey = 'notification_frequency';

  Future<void> initialize() async {
    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(initSettings);
  }

  Future<void> requestPermission() async {
    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> setNotificationFrequency(NotificationFrequency frequency) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_notificationFrequencyKey, frequency.toString());

    if (frequency == NotificationFrequency.none) {
      await cancelAllNotifications();
      return;
    }

    await scheduleNotifications(frequency);
  }

  Future<NotificationFrequency> getNotificationFrequency() async {
    final prefs = await SharedPreferences.getInstance();
    final frequencyString = prefs.getString(_notificationFrequencyKey);

    if (frequencyString == null) {
      return NotificationFrequency.none;
    }

    return NotificationFrequency.values.firstWhere(
      (e) => e.toString() == frequencyString,
    );
  }

  Future<void> scheduleNotifications(NotificationFrequency frequency) async {
    await cancelAllNotifications();

    if (frequency == NotificationFrequency.daily) {
      await _scheduleDailyNotification();
    } else if (frequency == NotificationFrequency.weekend) {
      await _scheduleWeekendNotification();
    }
  }

  Future<void> _scheduleDailyNotification() async {
    final now = DateTime.now();
    final scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      20, // 20:00に通知
      00,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime.add(const Duration(days: 1));
    }

    await _notifications.zonedSchedule(
      0,
      S.current.notificationDailyTitle,
      S.current.notificationDailyBody,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_notification',
          'Daily Notifications',
          channelDescription: 'Daily mood tracking reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _scheduleWeekendNotification() async {
    final now = DateTime.now();
    final nextWeekend = _getNextWeekend(now);

    await _notifications.zonedSchedule(
      0,
      S.current.notificationWeekendTitle,
      S.current.notificationWeekendBody,
      tz.TZDateTime.from(nextWeekend, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'weekend_notification',
          'Weekend Notifications',
          channelDescription: 'Weekend mood tracking reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  DateTime _getNextWeekend(DateTime now) {
    final daysUntilWeekend = 6 - now.weekday;
    final nextWeekend = now.add(Duration(days: daysUntilWeekend));
    return DateTime(
      nextWeekend.year,
      nextWeekend.month,
      nextWeekend.day,
      20, // 20:00に通知
      0,
    );
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}
