import 'package:flutter/material.dart';

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
        title: Text("症状ワークシート"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () {},
        child: Icon(
          Icons.mode_edit,
          color: colors.onPrimary,
        ),
      ),
      body: Center(
        child: ListView(
          children: const [
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
      margin: EdgeInsets.all(10),
      color: colors.onPrimary,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 50,
            decoration: BoxDecoration(
              color: colors.inverseSurface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            child: Center(
                child: Text(
              moodValue,
              style: TextStyle(color: colors.onPrimary, fontSize: 21),
            )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                actionText,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
