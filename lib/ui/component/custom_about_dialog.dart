import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../router/page_navigator.dart';

class CustomAboutDialog extends StatelessWidget {
  final String applicationName;
  final String applicationVersion;
  final ImageProvider applicationIcon;
  final String applicationLegalese;

  const CustomAboutDialog({
    super.key,
    required this.applicationName,
    required this.applicationVersion,
    required this.applicationIcon,
    required this.applicationLegalese,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: applicationIcon,
              radius: 40,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  applicationName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  applicationVersion,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    applicationLegalese,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => PageNavigator.pop(context),
          child: Text(S.of(context).dialogOk),
        ),
      ],
    );
  }
}
