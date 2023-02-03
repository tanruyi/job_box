import 'package:flutter/material.dart';

class ProfileSectionHeader extends StatelessWidget {
  const ProfileSectionHeader({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            // TODO: declare function to add edit info
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

class ProfileFieldLabel extends StatelessWidget {
  const ProfileFieldLabel(
      {super.key, required this.label, this.topPadding = 24});

  final String label;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, topPadding, 0.0, 6.0),
        child: Text(
          label,
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}

class ProfileDocCard extends StatelessWidget {
  const ProfileDocCard(
      {super.key, required this.fileName, required this.uploadedDate});

  final String fileName;
  final String uploadedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.secondary,
        child: ListTile(
          leading: Icon(
            Icons.description,
            size: 40,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            fileName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          subtitle: Text(
            uploadedDate,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 10),
          ),
        ),
      ),
    );
  }
}
