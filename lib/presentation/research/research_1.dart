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

class InputModal extends StatefulWidget {
  const InputModal({super.key});

  @override
  State<InputModal> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<InputModal> {
  double _value = 0.0;
  double _startValue = 0.0;
  double _endValue = 0.0;

  int moodNum = 1;
  void _changeSlider(double e) => setState(() {
        _value = e;
      });
  void _startSlider(double e) => setState(() {
        _startValue = e;
      });
  void _endSlider(double e) => setState(() {
        _endValue = e;
      });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('2023/11/1'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  color: moodNum == -5 ? Colors.grey : Colors.green,
                  onPressed: () {
                    setState(() {
                      if (moodNum == 1) {
                        moodNum -= 2;
                      } else if (moodNum > -5) {
                        moodNum--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove)),
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '気分値',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(
                          moodNum.toString(),
                          style: const TextStyle(fontSize: 52),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                  color: moodNum == 5 ? Colors.grey : Colors.green,
                  onPressed: () {
                    setState(() {
                      if (moodNum == -1) {
                        moodNum += 2;
                      } else if (moodNum < 5) {
                        moodNum++;
                      }
                    });
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 32, 56, 0),
            child: Slider(
              label: _value.toString(),
              min: 0,
              max: 16,
              value: _value,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              divisions: 16,
              onChanged: _changeSlider,
              onChangeStart: _startSlider,
              onChangeEnd: _endSlider,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 72),
              Row(
                children: [
                  const Text(
                    '予定数 ',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(
                      _value.toInt().toString(),
                      style: const TextStyle(fontSize: 52),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 56, 16, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('保存'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
