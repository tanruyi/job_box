import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Row(
          children: [
            Text(
              "Your Profile",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ],
        ),
      ),
    );
  }
}
