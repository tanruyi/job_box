import 'package:flutter/material.dart';

class ResumeSwitchButton extends StatefulWidget {
  const ResumeSwitchButton({super.key});

  @override
  State<ResumeSwitchButton> createState() => _ResumeSwitchButtonState();
}

class _ResumeSwitchButtonState extends State<ResumeSwitchButton> {
  bool includedInResume = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Included in Resume"),
        Switch(
            value: includedInResume,
            onChanged: (value) {
              setState(() {
                includedInResume = value;
              });
            })
      ],
    );
  }
}
