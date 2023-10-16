import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [OverlayLoading] の表示状態を管理するProvider
final overlayLoadingProvider = StateProvider(
  (_) => false,
);

/// ローディング表示用ウィジェット
class OverlayLoading extends StatelessWidget {
  const OverlayLoading({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
