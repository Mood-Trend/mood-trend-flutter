import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../domain/enum/notification_frequency_type.dart';
import '../../generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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

  Future<void> setNotificationFrequency(
      NotificationFrequencyType frequency) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_notificationFrequencyKey, frequency.toString());

    if (frequency == NotificationFrequencyType.none) {
      await cancelAllNotifications();
      return;
    }

    await scheduleNotifications(frequency);
  }

  Future<NotificationFrequencyType> getNotificationFrequency() async {
    final prefs = await SharedPreferences.getInstance();
    final frequencyString = prefs.getString(_notificationFrequencyKey);

    if (frequencyString == null) {
      return NotificationFrequencyType.none;
    }

    return NotificationFrequencyType.values.firstWhere(
      (e) => e.toString() == frequencyString,
    );
  }

  Future<void> scheduleNotifications(
      NotificationFrequencyType frequency) async {
    await cancelAllNotifications();

    if (frequency == NotificationFrequencyType.daily) {
      await _scheduleDailyNotification();
    } else if (frequency == NotificationFrequencyType.weekend) {
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
