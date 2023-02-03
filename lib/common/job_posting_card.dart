import 'package:flutter/material.dart';
import 'package:job_box/screens/application.dart';

// FUNCTIONS

handleApplyButtonClick(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ApplicationScreen()),
  );
}

// Bottom sheet modal to show details of each job posting, opens on click on job posting card
class JobPostingDetailsModal extends StatelessWidget {
  const JobPostingDetailsModal({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.area,
    required this.jobDescription,
    required this.requirements,
    required this.companyLogo,
  });

  final String companyName;
  final String jobTitle;
  final String area;
  final String jobDescription;
  final List<String> requirements;
  final String companyLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // For company logo, company name, job title and area
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      companyLogo,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Text(
                    companyName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      jobTitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "$area, Singapore",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 165, 158, 151),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // For job description & requirements
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Job Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    jobDescription,
                    style: const TextStyle(height: 1.7),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Requirements",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: requirements.length,
                    itemBuilder: (context, index) {
                      return Text("-${requirements[index]}");
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    handleApplyButtonClick(context);
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(250, 35)),
                  child: const Text(
                    "Apply This Job",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    elevation: 0,
                  ),
                  child: const Icon(
                    Icons.bookmark,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobPostingCard extends StatelessWidget {
  const JobPostingCard({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.postingDate,
    required this.minSalary,
    required this.maxSalary,
    required this.area,
    required this.jobDescription,
    required this.requirements,
    required this.companyLogo,
  });

  final String companyName;
  final String jobTitle;
  final String postingDate;
  final int minSalary;
  final int maxSalary;
  final String area;
  final String jobDescription;
  final List<String> requirements;
  final String companyLogo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return JobPostingDetailsModal(
                companyName: companyName,
                jobTitle: jobTitle,
                area: area,
                jobDescription: jobDescription,
                requirements: requirements,
                companyLogo: companyLogo,
              );
            });
      },
      child: Card(
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
      ),
    );
  }
}
