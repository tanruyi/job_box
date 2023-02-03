import 'package:flutter/material.dart';

class JobPostingCard extends StatelessWidget {
  const JobPostingCard(
      {super.key,
      required this.companyName,
      required this.jobTitle,
      required this.postingDate,
      required this.minSalary,
      required this.maxSalary,
      required this.area});

  final String companyName;
  final String jobTitle;
  final String postingDate;
  final int minSalary;
  final int maxSalary;
  final String area;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  companyName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Text(
                  postingDate,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 165, 158, 151),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Text(
                  jobTitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: Color.fromARGB(255, 165, 158, 151),
                  size: 16,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                  child: Text(
                    "\$${minSalary}k-\$${maxSalary}k/month",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 165, 158, 151),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "$area, Singapore",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 165, 158, 151),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
