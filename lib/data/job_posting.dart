class JobPosting {
  final String companyName;
  final String jobTitle;
  final String postingDate;
  final int minSalary;
  final int maxSalary;
  final String area;
  final String jobDescription;
  final List<String> requirements;
  final String companyLogo;

  JobPosting(
      this.companyName,
      this.jobTitle,
      this.postingDate,
      this.minSalary,
      this.maxSalary,
      this.area,
      this.jobDescription,
      this.requirements,
      this.companyLogo);
}
