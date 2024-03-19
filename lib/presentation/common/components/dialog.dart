import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/utils/l10n/generated/l10n.dart';

/// ダイアログ表示用の [GlobalKey]
final navigatorKeyProvider = Provider(
  (_) => GlobalKey<NavigatorState>(),
);

/// エラーダイアログ
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('エラー'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

/// 確認ダイアログ
class ConfirmDialog extends ConsumerWidget {
  const ConfirmDialog({
    super.key,
    required this.message,
    required this.onApproved,
  });

  final String message;
  final VoidCallback? onApproved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(S.of(context).dialogConfirm),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.of(context).dialogNo),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onApproved?.call();
          },
          child: Text(S.of(context).dialogYes),
        ),
      ],
    );
  }
}
