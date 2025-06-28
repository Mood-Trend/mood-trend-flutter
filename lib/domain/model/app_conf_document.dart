/// Firebase Firestore に保存されるユーザーのドキュメントモデル
class AppConfDocument {
  AppConfDocument({required this.value});

  final dynamic value;

  factory AppConfDocument.fromJson(String id, Map<String, dynamic> json) =>
      AppConfDocument(
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
      };
}
