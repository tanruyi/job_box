import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_box/screens/job_listings.dart';
import 'package:job_box/screens/sign_up.dart';

// COMPONENTS
class LoginScreenTitle extends StatelessWidget {
  const LoginScreenTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              fontFamily: 'Bitter', fontWeight: FontWeight.bold, fontSize: 40),
          children: <TextSpan>[
            TextSpan(
              text: "Job",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextSpan(
                text: "box",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ))
          ]),
    );
  }
}

class EmailInputFieldLabel extends StatelessWidget {
  const EmailInputFieldLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 6.0),
        child: Text("Email"),
      ),
    );
  }
}

class EmailInputField extends StatelessWidget {
  const EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PasswordInputFieldLabel extends StatelessWidget {
  const PasswordInputFieldLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 6.0),
        child: Text("Password"),
      ),
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
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
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

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Forgot Password?");
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JobListingsPage()),
        );
      },
      style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
      child: const Text(
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SignUpHyperlink extends StatelessWidget {
  const SignUpHyperlink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
            fontFamily: 'Bitter',
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            TextSpan(
                text: "Sign Up",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ))
          ]),
    );
  }
}

// SCREEN LAYOUT

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 90.0),
                child: LoginScreenTitle(),
              ),
              EmailInputFieldLabel(),
              EmailInputField(),
              PasswordInputFieldLabel(),
              PasswordInputField(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: ForgotPasswordText(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: LoginButton(),
              ),
              SignUpHyperlink(),
            ],
          ),
        ),
      ),
    );
  }
}
