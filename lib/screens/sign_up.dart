import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:job_box/common/buttons.dart';
import 'package:job_box/common/input_fields.dart';
import 'package:job_box/screens/login.dart';

// COMPONENTS

class SignUpScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SignUpScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  String imageURLInput = "";
  String imageURL = "";

  void addImageUrlDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add Image Address"),
            content: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    imageURLInput = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        imageURL = imageURLInput;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: GestureDetector(
          onTap: () {
            addImageUrlDialog();
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            radius: 50,
            child: imageURL == ""
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 48,
                    child: Text(
                      "Add \nPhoto",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      textAlign: TextAlign.center,
                    ),
                  )
                : CircleAvatar(
                    foregroundImage: NetworkImage(imageURL),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 48,
                  ),
          ),
        ),
      ),
    );
  }
}

class RetypePasswordField extends StatelessWidget {
  const RetypePasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      enableSuggestions: false,
      autocorrect: false,
      obscureText: true,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
      ),
    );
  }
}

class LoginHyperlink extends StatelessWidget {
  const LoginHyperlink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Bitter',
        ),
        children: <TextSpan>[
          TextSpan(
            text: "Already have an account? ",
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
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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

class TermsAndC extends StatelessWidget {
  const TermsAndC({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(fontFamily: 'Bitter', fontSize: 10),
        children: <TextSpan>[
          TextSpan(
            text: "By creating an account, you agree to Jobbox's \n",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          TextSpan(
            text: "Terms of Use",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          TextSpan(
            text: " and ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// FUNCTIONS
handleCreateAccountButtonClick(BuildContext context) {
  Navigator.pop(context);
}

// SCREEN LAYOUT

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: const SignUpScreenAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const ImageUpload(),
              const TextInputFieldLabel(label: "Email"),
              const TextInputField(),
              const TextInputFieldLabel(label: "New Password"),
              const PasswordInputField(),
              const TextInputFieldLabel(label: "Re-type Password"),
              const RetypePasswordField(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 20.0),
                child: BaseButton(
                  handlePress: () {
                    handleCreateAccountButtonClick(context);
                  },
                  label: "Create Account",
                ),
              ),
              const LoginHyperlink(),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: TermsAndC(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
