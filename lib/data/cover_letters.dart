import 'package:job_box/data/uploaded_document.dart';

class UploadedCoverLetters {
  final List<UploadedDocument> allCoverLetters = [];

  addCoverLetter(String fileName, String uploadedDate) {
    var newCoverLetter = UploadedDocument(fileName, uploadedDate);

    allCoverLetters.add(newCoverLetter);
  }

  List<UploadedDocument> get getAllCoverLetters {
    return allCoverLetters;
  }
}

final allCoverLettersInstance = UploadedCoverLetters()
  ..addCoverLetter("My cover letter final.doc", "11/06/20")
  ..addCoverLetter("My cover letter.doc", "06/06/20");
