import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_trend_flutter/presentation/mixin/error_handler_mixin.dart';

class TableModal extends StatefulWidget {
  const TableModal({super.key});

  @override
  State<TableModal> createState() => _TableModalState();
}

class _TableModalState extends State<TableModal> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surfaceVariant,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("症状ワークシート"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const EditModal();
            },
          );
        },
        child: Icon(
          Icons.mode_edit,
          color: colors.onPrimary,
        ),
      ),
      body: Center(
        child: ListView(
          children: const [
            SizedBox(
              height: 16,
            ),
            TableCard(
              moodValue: "+5",
              actionText: "アイデアが湧いてきて止まらない。実現に向けて実際に向けて動く。",
            ),
            TableCard(
              moodValue: "+4",
              actionText: "",
            ),
            TableCard(
              moodValue: "+3",
              actionText: "何かしたくてたまらない",
            ),
            TableCard(
              moodValue: "+2",
              actionText: "",
            ),
            TableCard(
              moodValue: "+1",
              actionText: "朝目覚めて前向きな気持ちがする",
            ),
            SizedBox(
              height: 30,
            ),
            TableCard(
              moodValue: "-1",
              actionText: "朝目覚めて後ろ向きな気持ちがする",
            ),
            TableCard(
              moodValue: "-2",
              actionText: "",
            ),
            TableCard(
              moodValue: "-3",
              actionText: "色々なことやめたくなる。何をする気力も自信もない。",
            ),
            TableCard(
              moodValue: "-4",
              actionText: "",
            ),
            TableCard(
              moodValue: "-5",
              actionText: "自分に価値はなく、迷惑な存在と思う。死を考える。",
            ),
          ],
        ),
      ),
    );
  }
}

class TableCard extends StatelessWidget {
  const TableCard({
    super.key,
    required this.moodValue,
    required this.actionText,
  });

  final String moodValue;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.all(10),
      color: colors.onPrimary,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 50,
            decoration: BoxDecoration(
              color: colors.secondaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Center(
                child: Text(
              moodValue,
              style: TextStyle(color: colors.outline, fontSize: 22),
            )),
          ),
          Expanded(
            child: SizedBox(
              // これがないと文字数が多い時にUIが崩れる
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    actionText,
                    style: TextStyle(
                      fontSize: 16,
                      color: colors.inverseSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditModal extends ConsumerStatefulWidget {
  const EditModal({super.key});

  @override
  ConsumerState<EditModal> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<EditModal> with ErrorHandlerMixin {
  double _moodValue = 1;
  final controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("編集"),
      content: SizedBox(
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(52, 48, 52, 0),
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
                    const SizedBox(width: 20),
                    const Text(
                      '気分値',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 75,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Center(
                          child: Text(
                            _moodValue.toInt().toString(),
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "症状",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("キャンセル"),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text("変更"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
