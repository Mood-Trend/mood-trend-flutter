import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 読み取り専用モードのステート
class ReadOnlyState {
  final bool isReadOnly;
  final String? ownerUid;

  const ReadOnlyState({
    this.isReadOnly = false,
    this.ownerUid,
  });

  ReadOnlyState copyWith({
    bool? isReadOnly,
    String? ownerUid,
  }) {
    return ReadOnlyState(
      isReadOnly: isReadOnly ?? this.isReadOnly,
      ownerUid: ownerUid ?? this.ownerUid,
    );
  }
}

/// 読み取り専用モードのプロバイダー
final isReadOnlyProvider = StateProvider<ReadOnlyState>(
  (ref) => const ReadOnlyState(),
);
