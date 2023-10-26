import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mood_trend_flutter/presentation/research/research_1.dart';
import 'package:mood_trend_flutter/presentation/research/research_2.dart';
import 'package:mood_trend_flutter/utils/page_navigator.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Trend'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('userId: $userId'),
              const Gap(16),
              ElevatedButton(
                onPressed: () => PageNavigator.push(context, const Research1()),
                child: const Text('調査用ページ 1 へ'),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: () => PageNavigator.push(context, const Research2()),
                child: const Text('調査用ページ 2 へ'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
