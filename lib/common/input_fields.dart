import 'package:flutter/material.dart';

class TextInputFieldLabel extends StatelessWidget {
  const TextInputFieldLabel(
      {Key? key, required this.label, this.topPadding = 24})
      : super(key: key);

  final String label;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, topPadding, 0.0, 6.0),
        child: Text(label),
      ),
    );
  }
}

class TextInputField extends StatefulWidget {
  const TextInputField({super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
      ),
      style: TextStyle(fontSize: 12),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enableSuggestions: false,
      autocorrect: false,
      obscureText: passwordVisible,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true,
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          )),
    );
  }
}
