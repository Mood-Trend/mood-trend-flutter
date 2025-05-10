import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mood_trend_flutter/application/common/states/is_read_only_provider.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/invite_repository.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/user_repository.dart';
import 'package:mood_trend_flutter/presentation/common/error_handler_mixin.dart';
import 'package:mood_trend_flutter/presentation/graph/home_page.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

/// QRコード読み取りページ
class ScanQRPage extends ConsumerStatefulWidget {
  const ScanQRPage({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends ConsumerState<ScanQRPage>
    with ErrorHandlerMixin {
  final MobileScannerController _controller = MobileScannerController();
  bool _isProcessing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _processCode(String code) async {
    if (_isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      // "mood-trend:"プレフィックスを削除
      if (code.startsWith('mood-trend:')) {
        code = code.substring('mood-trend:'.length);
      }

      // 招待コードを検証して使用
      final ownerUid = await ref
          .read(inviteRepositoryProvider)
          .validateAndUseInviteCode(code);

      if (ownerUid == null) {
        throw Exception('無効な招待コードです');
      }

      // 自分自身を支援者として追加
      await ref.read(userRepositoryProvider).addSupporter(
            uid: ownerUid,
            supporterId: widget.uid,
          );

      // 読み取り専用モードに設定
      ref.read(isReadOnlyProvider.notifier).state = ReadOnlyState(
        isReadOnly: true,
        ownerUid: ownerUid,
      );

      if (mounted) {
        // ホーム画面に遷移
        await PageNavigator.popUntilRoot(context);
        await PageNavigator.pushReplacement(
          context,
          HomePage(userId: ownerUid),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('QRコードの処理に失敗しました: $e'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QRコードをスキャン'),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: _controller,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  final code = barcode.rawValue;
                  if (code != null) {
                    _processCode(code);
                  }
                }
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'カメラをQRコードに向けてください',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
