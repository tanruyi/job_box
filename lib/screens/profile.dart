import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/profile_field.dart';
import '../models/profile.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<Profile>(
          builder: (context, profile, child) {
            return Column(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  radius: 50,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 48,
                    child: Text(
                      "Add \nPhoto",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const ProfileSectionHeader(header: "Contact Info"),
                const ProfileFieldLabel(label: "Full Name"),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(profile.fullName),
                ),
                const ProfileFieldLabel(label: "Email"),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(profile.email),
                ),
                const ProfileFieldLabel(label: "Mobile Number"),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(profile.mobile),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ProfileSectionHeader(header: "Employment Information"),
                ),
                const ProfileFieldLabel(
                  label: "Resume",
                  topPadding: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ProfileDocCard(
                    fileName: profile.resume.fileName,
                    uploadedDate: profile.resume.uploadedDate,
                  ),
                ),
                const ProfileFieldLabel(
                  label: "Cover Letter",
                  topPadding: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ProfileDocCard(
                    fileName: profile.coverLetter.fileName,
                    uploadedDate: profile.coverLetter.uploadedDate,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
