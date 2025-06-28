import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/utils/app_exception.dart';

/// URL起動サービス
class UrlLauncherService {
  const UrlLauncherService(this.ref);

  final Ref ref;

  /// URLを起動する
  Future<void> launch(
    String urlString, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    try {
      final url = Uri.parse(urlString);
      final result = await launchUrl(url, mode: mode);
      if (!result) throw const AppException('指定された URL が起動できませんでした');
    } catch (e) {
      throw AppException('URL 起動時にエラーが発生しました: $e');
    }
  }
}
