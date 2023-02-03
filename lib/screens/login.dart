import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_box/common/buttons.dart';
import 'package:job_box/common/input_fields.dart';
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
            ),
          )
        ],
      ),
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
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}

// FUNCTIONS

handleLoginButtonClick(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const JobListingsScreen()),
  );
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
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 90.0),
                child: LoginScreenTitle(),
              ),
              const TextInputFieldLabel(label: "Email"),
              // EmailInputField(),
              const TextInputField(),
              const TextInputFieldLabel(label: "Password"),
              const PasswordInputField(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: ForgotPasswordText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BaseButton(
                    handlePress: () {
                      handleLoginButtonClick(context);
                    },
                    label: "Login"),
              ),
              const SignUpHyperlink(),
            ],
          ),
        ),
      ),
    );
  }
}
