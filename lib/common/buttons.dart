import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({Key? key, required this.handlePress, required this.label})
      : super(key: key);

  final VoidCallback handlePress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handlePress,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 40),
          minimumSize: const Size.fromHeight(40)),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
