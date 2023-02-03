import 'package:flutter/material.dart';
import 'package:job_box/screens/profile.dart';

import 'applied_jobs.dart';
import 'job_listings.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _bodyOptions = [
    Column(
      children: const [
        JobListingsScreenTitleBar(),
        JobListingsScreenTabBar(),
      ],
    ),
    const AppliedJobsScreen(),
    const ProfileScreen(),
  ];

  void _changeBody(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: _bodyOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _changeBody,
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
