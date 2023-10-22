import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Trend'),
      ),
      body: Center(
        /// 緑色のコンテナー
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              userId,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}
