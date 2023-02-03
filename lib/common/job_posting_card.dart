import 'package:flutter/material.dart';
import 'package:job_box/data/job_posting.dart';
import 'package:job_box/screens/application.dart';

// FUNCTIONS

handleApplyButtonClick(BuildContext context, JobPosting jobPosting) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ApplicationScreen(jobPosting: jobPosting)),
  );
}

// Bottom sheet modal to show details of each job posting, opens on click on job posting card
class JobPostingDetailsModal extends StatelessWidget {
  const JobPostingDetailsModal({
    super.key,
    required this.jobPosting,
  });

  final JobPosting jobPosting;

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
                      jobPosting.companyLogo,
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Text(
                    jobPosting.companyName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      jobPosting.jobTitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "${jobPosting.area}, Singapore",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    jobPosting.jobDescription,
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
                    itemCount: jobPosting.requirements.length,
                    itemBuilder: (context, index) {
                      return Text("-${jobPosting.requirements[index]}");
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
                    handleApplyButtonClick(context, jobPosting);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(250, 35)),
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
    required this.jobPosting,
  });

  final JobPosting jobPosting;

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
                jobPosting: jobPosting,
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
                    jobPosting.companyName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    jobPosting.postingDate,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    jobPosting.jobTitle,
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
                  Icon(
                    Icons.monetization_on,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                    child: Text(
                      "\$${jobPosting.minSalary}k-\$${jobPosting.maxSalary}k/month",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    "${jobPosting.area}, Singapore",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
