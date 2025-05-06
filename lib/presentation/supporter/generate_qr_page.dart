import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/infrastructure/firebase/invite_repository.dart';
import 'package:mood_trend_flutter/presentation/common/components/loading.dart';
import 'package:mood_trend_flutter/presentation/common/error_handler_mixin.dart';
import 'package:mood_trend_flutter/utils/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// QRコード生成ページ
class GenerateQRPage extends ConsumerStatefulWidget {
  const GenerateQRPage({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<GenerateQRPage> createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends ConsumerState<GenerateQRPage>
    with ErrorHandlerMixin {
  String? _inviteCode;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _generateInviteCode();
  }

  Future<void> _generateInviteCode() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final inviteCode = await ref
          .read(inviteRepositoryProvider)
          .createInviteCode(widget.uid);
      setState(() {
        _inviteCode = inviteCode;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('招待コードの生成に失敗しました: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('支援者QRコード'),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: _isLoading
          ? const OverlayLoading()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '支援者に下記のQRコードを読み取ってもらいましょう',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  if (_inviteCode != null)
                    QrImageView(
                      data: 'mood-trend:$_inviteCode',
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  const SizedBox(height: 24),
                  Text(
                    'コード: $_inviteCode',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '※ このコードは7日間有効です',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _generateInviteCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text('新しいコードを生成'),
                  ),
                ],
              ),
            ),
    );
  }
}
