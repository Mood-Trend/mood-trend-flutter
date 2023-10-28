import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase Firestore に保存される症状ワークシートのドキュメントモデル
class MoodWorksheetDocument {
  MoodWorksheetDocument({
    required this.worksheetId,
    required this.minus_5,
    required this.minus_4,
    required this.minus_3,
    required this.minus_2,
    required this.minus_1,
    required this.plus_1,
    required this.plus_2,
    required this.plus_3,
    required this.plus_4,
    required this.plus_5,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String worksheetId;
  final String minus_5;
  final String minus_4;
  final String minus_3;
  final String minus_2;
  final String minus_1;
  final String plus_1;
  final String plus_2;
  final String plus_3;
  final String plus_4;
  final String plus_5;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory MoodWorksheetDocument.fromJson(
    String worksheetId,
    Map<String, dynamic> json,
  ) =>
      MoodWorksheetDocument(
        worksheetId: worksheetId,
        minus_5: json['minus_5'] as String,
        minus_4: json['minus_4'] as String,
        minus_3: json['minus_3'] as String,
        minus_2: json['minus_2'] as String,
        minus_1: json['minus_1'] as String,
        plus_1: json['plus_1'] as String,
        plus_2: json['plus_2'] as String,
        plus_3: json['plus_3'] as String,
        plus_4: json['plus_4'] as String,
        plus_5: json['plus_5'] as String,
        createdAt: (json['created_at'] as Timestamp).toDate(),
        updatedAt: (json['updated_at'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'minus_5': minus_5,
        'minus_4': minus_4,
        'minus_3': minus_3,
        'minus_2': minus_2,
        'minus_1': minus_1,
        'plus_1': plus_1,
        'plus_2': plus_2,
        'plus_3': plus_3,
        'plus_4': plus_4,
        'plus_5': plus_5,
        'created_at': createdAt,
        'updated_at': FieldValue.serverTimestamp(),
      };
}

/// [MoodWorksheetDocument] の拡張
extension on MoodWorksheetDocument {}
