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
    return Container(
      height: 350,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('2023/11/1'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaceButton(
                  imageUrl: 'images/minus5.png',
                  ontap: () {
                    setState(() {
                      moodNum = -5;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/minus4.png',
                  ontap: () {
                    setState(() {
                      moodNum = -4;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/minus3.png',
                  ontap: () {
                    setState(() {
                      moodNum = -3;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/minus2.png',
                  ontap: () {
                    setState(() {
                      moodNum = -2;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/minus1.png',
                  ontap: () {
                    setState(() {
                      moodNum = -1;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/plus1.png',
                  ontap: () {
                    setState(() {
                      moodNum = 1;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/plus2.png',
                  ontap: () {
                    setState(() {
                      moodNum = 2;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/plus3.png',
                  ontap: () {
                    setState(() {
                      moodNum = 3;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/plus4.png',
                  ontap: () {
                    setState(() {
                      moodNum = 4;
                    });
                  },
                ),
                FaceButton(
                  imageUrl: 'images/plus5.png',
                  ontap: () {
                    setState(() {
                      moodNum = 5;
                    });
                  },
                ),
              ],
            ),
          ),
          Text(
            moodNum.toString(),
            style: TextStyle(fontSize: 52),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(56, 32, 56, 0),
            child: Slider(
              label: '${_value}',
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
              SizedBox(width: 72),
              Row(
                children: [
                  Text(
                    '予定数',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(
                      _value.toInt().toString(),
                      style: TextStyle(fontSize: 52),
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
                  child: Text('保存'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class FaceButton extends StatelessWidget {
  const FaceButton({
    super.key,
    required this.imageUrl,
    required this.ontap,
  });
  final String imageUrl;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ontap();
        },
        child: SizedBox(width: 32, child: Image.asset(imageUrl)));
  }
}
