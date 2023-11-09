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

  int moodNum = 1;
  void _changeSlider(double e) => setState(() {
        _value = e;
      });
  double _moodValue = 1.0;

  void _moodChangeSlider(double e) => setState(() {
        _moodValue = e;
      });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('2023/11/1'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 32, 56, 0),
            child: Slider(
              value: _moodValue,
              min: -5.0,
              max: 5.0,
              divisions: 10,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              onChangeStart: (value) {
                if (value == 0.0) {
                  setState(() {
                    _moodValue = _moodValue > 0 ? 1.0 : -1.0;
                  });
                }
              },
              label: _moodValue.toString(),
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
                    '気分値 ',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Text(
                        _moodValue.toInt().toString(),
                        style: const TextStyle(fontSize: 52),
                      ),
                    ),
                  ),
                ],
              ),
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
