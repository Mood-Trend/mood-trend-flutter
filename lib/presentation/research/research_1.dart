import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/firebase/mood_point_repository.dart';
import '../mixin/error_handler_mixin.dart';

class Research1 extends StatelessWidget {
  const Research1({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Trend'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: colors.background,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const InputModal();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Research1'),
      ),
    );
  }
}

class InputModal extends ConsumerStatefulWidget {
  const InputModal({super.key});

  @override
  ConsumerState<InputModal> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<InputModal> with ErrorHandlerMixin {
  double _plannedValue = 0.0;
  DateTime date = DateTime.now();

  int moodNum = 1;
  void _changeSlider(double e) => setState(() {
        _plannedValue = e;
      });
  double _moodValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),
          TextButton.icon(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                setState(() {
                  date = selectedDate;
                });
              }
            },
            icon: const Icon(Icons.calendar_month),
            label: Text(
                "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 48, 56, 0),
            child: Slider(
              value: _moodValue,
              min: -5.0,
              max: 5.0,
              divisions: 10,
              onChangeStart: (value) {
                if (value == 0.0) {
                  setState(() {
                    _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                  });
                }
              },
              label: _moodValue.toInt().toString(),
              onChanged: (value) {
                if (value != 0.0) {
                  setState(() {
                    _moodValue = value;
                  });
                }
              },
              onChangeEnd: (value) {
                if (value == 0.0) {
                  setState(() {
                    _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                  });
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    '気分値',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Center(
                        child: Text(
                          _moodValue.toInt().toString(),
                          style: const TextStyle(fontSize: 52),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 24, 56, 0),
            child: Slider(
              label: _plannedValue.toInt().toString(),
              min: 0,
              max: 16,
              value: _plannedValue,
              divisions: 16,
              onChanged: _changeSlider,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 80),
              Row(
                children: [
                  const Text(
                    '予定数',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Center(
                        child: Text(
                          _plannedValue.toInt().toString(),
                          style: const TextStyle(fontSize: 52),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 56, 16, 0),
                child: TextButton(
                  onPressed: () async {
                    execute(
                      context,
                      ref,
                      action: () async {
                        // mood_points コレクションにドキュメントを追加
                        await ref.read(moodPointRepositoryProvider).add(
                              point: _moodValue.toInt(),
                              plannedVolume: _plannedValue.toInt(),
                              moodDate: date,
                            );

                        // モーダルを閉じる
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      successMessage: '気分値と予定数の登録が完了しました',
                    );
                  },
                  child: const Text(
                    '保存',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
