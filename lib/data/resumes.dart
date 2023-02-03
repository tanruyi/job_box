import 'package:job_box/data/uploaded_document.dart';

class UploadedResumes {
  final List<UploadedDocument> allResumes = [];

  addResume(String fileName, String uploadedDate) {
    var newResume = UploadedDocument(fileName, uploadedDate);

    allResumes.add(newResume);
  }

  List<UploadedDocument> get getAllResumes {
    return allResumes;
  }
}

final allResumeInstance = UploadedResumes()
  ..addResume("My Resume.pdf", "11/06/20");
