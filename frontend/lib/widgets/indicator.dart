import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.percentage,
    required this.title,
    required this.colors,
  });

  final int percentage;
  final String title;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleCircularProgressBar(
        size: 200,
        progressColors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.secondary
        ],
        valueNotifier: ValueNotifier(50),
        animationDuration: 1,
        onGetText: (value) => Text(
          "$title \n $value%",
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
