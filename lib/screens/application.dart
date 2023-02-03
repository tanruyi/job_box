import 'package:flutter/material.dart';
import 'package:job_box/common/buttons.dart';
import 'package:job_box/common/profile_field.dart';
import 'package:job_box/widgets/chip_field.dart';
import 'package:job_box/widgets/doc_upload.dart';
import 'package:job_box/common/input_fields.dart';
import 'package:job_box/common/linear_progress_indicator.dart';
import 'package:job_box/widgets/resume_switch_button.dart';
import 'package:job_box/data/cover_letters.dart';
import 'package:job_box/data/resumes.dart';

class ApplicationScreenUploadDocuments extends StatelessWidget {
  const ApplicationScreenUploadDocuments(
      {super.key, required this.companyName});

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Apply to $companyName",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
              child: ApplicationProgressIndicator(
                  title: "Uploading of Documents", progressValue: 0.33),
            ),
            DocUpload(
              title: "Resume",
              instructions: "Remember to include your most updated resume",
              allDocuments: allResumeInstance.getAllResumes,
            ),
            DocUpload(
              title: "Cover Letter",
              instructions: "Stand out with your cover letter",
              allDocuments: allCoverLettersInstance.getAllCoverLetters,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: BaseButton(
                  handlePress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ApplicationScreenEmploymentInformation(
                                companyName: companyName,
                              )),
                    );
                  },
                  label: "Proceed"),
            )
          ],
        ),
      ),
    );
  }
}

class ApplicationScreenEmploymentInformation extends StatelessWidget {
  const ApplicationScreenEmploymentInformation(
      {super.key, required this.companyName});

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Apply to $companyName",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
              child: ApplicationProgressIndicator(
                  title: "Employment Information", progressValue: 0.66),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Education",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ResumeSwitchButton(),
            const TextInputFieldLabel(label: "Name of School", topPadding: 8),
            const TextInputField(),
            const TextInputFieldLabel(label: "Course of study"),
            const TextInputField(),
            const TextInputFieldLabel(label: "Year graduated"),
            const TextInputField(),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Work Experience",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ResumeSwitchButton(),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Additional Skills",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ChipField(),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: BaseButton(
                  handlePress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ApplicationScreenReviewInformation(
                                companyName: companyName,
                              )),
                    );
                  },
                  label: "Proceed"),
            )
          ],
        ),
      ),
    );
  }
}

class ApplicationScreenReviewInformation extends StatelessWidget {
  const ApplicationScreenReviewInformation(
      {super.key, required this.companyName});

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Apply to $companyName",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 15),
              child: ApplicationProgressIndicator(
                  title: "Review Information", progressValue: 1),
            ),
            const ProfileSectionHeader(header: "Contact Info"),
            const ProfileFieldLabel(label: "Full Name"),
            const ProfileFieldLabel(label: "Email"),
            const ProfileFieldLabel(label: "Year graduated"),
            const ProfileSectionHeader(header: "Employment Information"),
            const ProfileFieldLabel(label: "Resume"),
            const ProfileFieldLabel(label: "Cover Letter"),
            const ProfileFieldLabel(label: "Additional Skills"),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: BaseButton(
                  handlePress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ApplicationScreenReviewInformation(
                                companyName: companyName,
                              )),
                    );
                  },
                  label: "Proceed"),
            )
          ],
        ),
      ),
    );
  }
}

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key, required this.companyName});

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return ApplicationScreenUploadDocuments(companyName: companyName);
  }
}
