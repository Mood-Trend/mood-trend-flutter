import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayLoadingNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() => false;

  void show() => state = true;

  void hide() => state = false;

  void toggle() => state = !state;
}
