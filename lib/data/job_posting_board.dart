import 'package:job_box/data/job_posting.dart';

class JobPostingBoard {
  final List<JobPosting> allJobPostings = [];

  // method to add new job posting
  addJobPosting(String companyName, String jobTitle, String postingDate,
      int minSalary, int maxSalary, String area,
      {String? jobDescription, List<String>? requirements}) {
    var newJobPosting = JobPosting(companyName.toUpperCase(), jobTitle,
        postingDate, minSalary, maxSalary, area, jobDescription, requirements);

    allJobPostings.add(newJobPosting);
  }

  // get method to retrieve list of job postings
  List<JobPosting> get getAllJobPostings {
    return allJobPostings;
  }
}

final jobPostingBoardInstance = JobPostingBoard()
  ..addJobPosting(
      "Slack", "Senior Product Designer", "09 Sept 2020", 6, 8, "East",
      jobDescription:
          "We're looking for a talented Lead Product Designer to join our rapidly growing design team to create intuitive and effective experiences for our customers as...",
      requirements: [
        "Developing product design concepts from client requirements"
      ])
  ..addJobPosting(
      "Crypto.com", "Front-End Developer", "09 Sept 2020", 5, 6, "Central")
  ..addJobPosting("Amazon", "Product Owner", "07 Sept 2020", 8, 10, "West")
  ..addJobPosting(
      "Asana", "Business Analyst", "06 Sept 2020", 7, 8, "North-East")
  ..addJobPosting(
      "Google", "Senior Product Designer", "05 Sept 2020", 8, 10, "West");
