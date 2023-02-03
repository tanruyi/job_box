import 'package:flutter/material.dart';
import 'package:job_box/data/resumes.dart';
import 'package:job_box/data/uploaded_document.dart';

class UploadedDocCard extends StatelessWidget {
  const UploadedDocCard(
      {super.key,
      required this.fileName,
      required this.uploadedDate,
      required this.selected});

  final String fileName;
  final String uploadedDate;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected == true
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary,
      child: ListTile(
        leading: Icon(
          Icons.description,
          size: 40,
          color: selected == true
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          fileName,
          style: TextStyle(
              color: selected == true
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        subtitle: Text(
          uploadedDate,
          style: TextStyle(
              color: selected == true
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              fontSize: 10),
        ),
      ),
    );
  }
}

class DocUpload extends StatefulWidget {
  const DocUpload(
      {super.key,
      required this.title,
      required this.instructions,
      required this.allDocuments});

  final String title;
  final String instructions;
  final List<UploadedDocument> allDocuments;

  @override
  State<DocUpload> createState() => _DocUploadState();
}

class _DocUploadState extends State<DocUpload> {
  int indexOfSelectedDoc = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              // TODO: declare function to add new documents
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.instructions,
              style: TextStyle(
                  fontSize: 11, color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.allDocuments.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexOfSelectedDoc = index;
                  });
                },
                child: UploadedDocCard(
                  fileName: widget.allDocuments[index].fileName,
                  uploadedDate: widget.allDocuments[index].uploadedDate,
                  selected: index == indexOfSelectedDoc ? true : false,
                ),
              );
            })
      ],
    );
  }
}
