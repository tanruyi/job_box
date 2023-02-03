import 'package:flutter/material.dart';

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
          const Text(
            "Hi Mark 👋🏻",
          ),
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
      child: PreferredSize(
        preferredSize: _tabBar.preferredSize,
        child: Material(
          color: Theme.of(context).colorScheme.secondary,
          child: _tabBar,
        ),
      ),
    );
  }
}

class JobListingsScreenTabView extends StatelessWidget {
  const JobListingsScreenTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      JobListingsScreenRecentJobsTab(),
    ]);
  }
}

class JobListingsScreenRecentJobsTab extends StatelessWidget {
  const JobListingsScreenRecentJobsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          JobListingsScreenTitleBar(),
          JobListingsScreenTabBar(),
          JobListingsScreenTabView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Job Listings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: "Applied Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
