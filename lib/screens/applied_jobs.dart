import 'package:flutter/material.dart';
import 'package:job_box/common/job_posting_card.dart';
import 'package:job_box/models/profile.dart';
import 'package:provider/provider.dart';

class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({super.key});

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
              "Your Applied Jobs",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            Icon(
              Icons.edit,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Profile>(builder: (context, profile, child) {
          return Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "You applied for ${profile.appliedJobs.length} jobs",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: profile.appliedJobs.length,
                  itemBuilder: (context, index) {
                    return JobPostingCard(
                        jobPosting: profile.appliedJobs[index]);
                  }),
            ],
          );
        }),
      ),
    );
  }
}
