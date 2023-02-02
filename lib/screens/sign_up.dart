import 'package:flutter/material.dart';
import 'package:job_box/screens/login.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        title: Text(
          "Sign Up",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Text("Sign Up Screen"),
    );
  }
}
