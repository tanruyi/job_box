import 'package:flutter/material.dart';

class ApplicationProgressIndicator extends StatelessWidget {
  const ApplicationProgressIndicator(
      {super.key, required this.title, required this.progressValue});

  final String title;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        LinearProgressIndicator(
          value: progressValue,
        ),
      ],
    );
  }
}
