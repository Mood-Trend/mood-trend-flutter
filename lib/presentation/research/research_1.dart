import 'package:flutter/material.dart';

class Research1 extends StatelessWidget {
  const Research1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Trend'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return InputModal();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Research1'),
      ),
    );
  }
}

class InputModal extends StatefulWidget {
  const InputModal({super.key});

  @override
  State<InputModal> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<InputModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, //ここに高さ
      child: Center(
          // ここにモーダルの中身
          ),
    );
  }
}
