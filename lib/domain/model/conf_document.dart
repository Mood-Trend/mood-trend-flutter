import 'package:cloud_firestore/cloud_firestore.dart';

import 'conf.dart';

/// Firebase Firestore に保存される Conf のドキュメントモデル
class ConfDocument {
  ConfDocument({
    required this.confId,
    required this.maxPlannedVolume,
    required this.isOnboardingCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String confId;
  final int maxPlannedVolume;
  final bool isOnboardingCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ConfDocument.fromJson(String confId, Map<String, dynamic> json) =>
      ConfDocument(
        confId: confId,
        maxPlannedVolume: json['max_planned_volume'] as int,
        isOnboardingCompleted: json['is_onboarding_completed'] as bool,
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'max_planned_volume': maxPlannedVolume,
        'is_onboarding_completed': isOnboardingCompleted,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [ConfDocument] の拡張
extension ConfDocumentExtension on ConfDocument {
  /// UserDocument -> AppUser
  Conf toConf() => Conf(
        confId: confId,
        maxPlannedVolume: maxPlannedVolume,
        isOnboardingCompleted: isOnboardingCompleted,
      );
}
