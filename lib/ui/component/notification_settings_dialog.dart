import 'package:flutter/material.dart';

import '../../domain/enum/notification_frequency_type.dart';
import '../../generated/l10n.dart';
import '../utils/notification_service.dart';

class NotificationSettingsDialog extends StatelessWidget {
  const NotificationSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).notificationSettingsTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(S.of(context).notificationSettingsDaily),
            subtitle: Text(S.of(context).notificationSettingsDailyDescription),
            onTap: () => _setNotificationFrequency(
              context,
              NotificationFrequencyType.daily,
            ),
          ),
          ListTile(
            title: Text(S.of(context).notificationSettingsWeekend),
            subtitle:
                Text(S.of(context).notificationSettingsWeekendDescription),
            onTap: () => _setNotificationFrequency(
              context,
              NotificationFrequencyType.weekend,
            ),
          ),
          ListTile(
            title: Text(S.of(context).notificationSettingsNone),
            subtitle: Text(S.of(context).notificationSettingsNoneDescription),
            onTap: () => _setNotificationFrequency(
              context,
              NotificationFrequencyType.none,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setNotificationFrequency(
    BuildContext context,
    NotificationFrequencyType frequency,
  ) async {
    final notificationService = NotificationService();

    if (frequency != NotificationFrequencyType.none) {
      await notificationService.requestPermission();
    }

    await notificationService.setNotificationFrequency(frequency);

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
