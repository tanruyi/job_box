import 'package:flutter/material.dart';
import 'package:job_box/common/job_posting_card.dart';
import 'package:job_box/data/job_posting_board.dart';
import 'package:provider/provider.dart';
import 'package:job_box/models/profile.dart';

import '../data/job_posting.dart';

class JobListingsScreenTitleBar extends StatelessWidget {
  const JobListingsScreenTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      color: Theme.of(context).colorScheme.primary,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<Profile>(
              builder: (context, profile, child) =>
                  Text("Hi ${profile.fullName} 👋🏻")),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 15),
            child: Text(
              "Find The Best Job Here!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            // style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 13, 0, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              isDense: true,
              filled: true,
              fillColor: const Color.fromARGB(255, 238, 169, 109),
              prefixIcon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 173, 126, 84),
                size: 25,
              ),
              hintText: "Start searching for jobs",
            ),
          ),
        ],
      ),
    );
  }
}

class JobListingsScreenTabBar extends StatelessWidget {
  const JobListingsScreenTabBar({super.key});

  TabBar get _tabBar => const TabBar(
        indicatorColor: Color.fromARGB(255, 234, 158, 91),
        tabs: [
          Tab(
            text: "Recent Jobs",
          ),
          Tab(text: "Near You"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: Theme.of(context).colorScheme.secondary,
              child: _tabBar,
            ),
          ),
          SizedBox(
            height: 457,
            child: TabBarView(
              children: [
                JobListingsScreenRecentJobsTab(),
                const Center(child: Text("Coming soon")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// FIXME: currently unable to scroll
class JobListingsScreenRecentJobsTab extends StatelessWidget {
  JobListingsScreenRecentJobsTab({super.key});

  final List<JobPosting> allJobPostings =
      jobPostingBoardInstance.allJobPostings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: allJobPostings.length,
      itemBuilder: (context, index) {
        return JobPostingCard(
          jobPosting: allJobPostings[index],
        );
      },
    );
  }
}
