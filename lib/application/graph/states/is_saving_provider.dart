import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSavingProvider = StateProvider.autoDispose<bool>((ref) => false);
