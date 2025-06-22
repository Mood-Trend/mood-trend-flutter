import 'package:flutter/material.dart';
import '../../domain/enum/weather.dart';
import 'weather_item_list.dart';

/// [WeatherSection] は、天気の状態を表示して、調整できるセクションです。
class WeatherSection extends StatelessWidget {
  final String labelText;
  final ValueChanged<List<Weather>>? onChanged;

  const WeatherSection({
    super.key,
    required this.labelText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        WeatherItemList(),
      ],
    );
  }
}
