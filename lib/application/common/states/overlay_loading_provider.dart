import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [OverlayLoading] を表示するかどうかを管理するプロバイダー
final overlayLoadingProvider = StateProvider.autoDispose<bool>((ref) => false);
