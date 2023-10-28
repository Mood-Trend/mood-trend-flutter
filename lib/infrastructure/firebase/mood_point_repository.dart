import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase Firestore に保存される気分数値（予定数含む）のドキュメントモデル
class MoodPointDocument {
  MoodPointDocument({
    required this.pointId,
    required this.point,
    required this.plannedVolume,
    required this.moodDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String pointId;
  final int point;
  final int plannedVolume;
  final DateTime moodDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory MoodPointDocument.fromJson(
    String uid,
    Map<String, dynamic> json,
  ) =>
      MoodPointDocument(
        pointId: uid,
        point: json['point'] as int,
        plannedVolume: json['planned_volume'] as int,
        moodDate: (json['mood_date'] as Timestamp).toDate(),
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'point': point,
        'planned_volume': plannedVolume,
        'mood_date': moodDate,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [MoodPointDocument] の拡張
extension on MoodPointDocument {}
