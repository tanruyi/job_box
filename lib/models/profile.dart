import 'package:flutter/material.dart';
import 'package:job_box/data/job_posting.dart';
import 'package:job_box/data/uploaded_document.dart';

class Profile extends ChangeNotifier {
  String email = "Adrianseverin@gmail.com";
  String fullName = "Adrian Severin";
  String mobile = "+6594717281";
  UploadedDocument resume = UploadedDocument("", "");
  UploadedDocument coverLetter = UploadedDocument("", "");
  List<String> skills = [];
  List<JobPosting> appliedJobs = [];
  String imageURL = "";

  updateEmail(newEmail) {
    email = newEmail;
  }

  updateName(newName) {
    fullName = newName;
  }

  updateMobile(newMobile) {
    mobile = newMobile;
  }

  updateResume(newResume) {
    resume = newResume;
  }

  updateCoverLetter(newCoverLetter) {
    coverLetter = newCoverLetter;
  }

  updateSkills(newSkills) {
    skills = newSkills;
  }

  addNewAppliedJob(newJob) {
    appliedJobs?.add(newJob);
  }

  updateImage(newURL) {
    imageURL = newURL;
  }
}
