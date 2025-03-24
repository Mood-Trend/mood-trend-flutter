import 'package:flutter/material.dart';
import '../../../infrastructure/services/notification_service.dart';

class NotificationSettingsDialog extends StatelessWidget {
  const NotificationSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('通知リマインドを設定しますか？'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('毎日'),
            subtitle: const Text('毎日20:00に通知'),
            onTap: () => _setNotificationFrequency(
              context,
              NotificationFrequency.daily,
            ),
          ),
          ListTile(
            title: const Text('週末1回'),
            subtitle: const Text('週末の20:00に通知'),
            onTap: () => _setNotificationFrequency(
              context,
              NotificationFrequency.weekend,
            ),
          ),
          ListTile(
            title: const Text('通知なし'),
            subtitle: const Text('通知を無効化'),
            onTap: () => _setNotificationFrequency(
              context,
              NotificationFrequency.none,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setNotificationFrequency(
    BuildContext context,
    NotificationFrequency frequency,
  ) async {
    final notificationService = NotificationService();

    if (frequency != NotificationFrequency.none) {
      await notificationService.requestPermission();
    }

    await notificationService.setNotificationFrequency(frequency);

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
