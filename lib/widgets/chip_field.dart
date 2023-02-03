import 'package:flutter/material.dart';

class ChipField extends StatefulWidget {
  const ChipField({super.key});

  @override
  State<ChipField> createState() => _ChipFieldState();
}

class _ChipFieldState extends State<ChipField> {
  List<String> selectedSkills = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.tertiary),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Wrap(
          children: [
            // TODO: to add & remove skills dynamically
            InputChip(
              label: Text(
                "Figma",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              deleteIconColor: Theme.of(context).colorScheme.onPrimary,
              selected: selectedSkills.contains("Figma"),
              onSelected: (value) {
                setState(() {
                  if (!selectedSkills.contains("Figma")) {
                    selectedSkills.add("Figma");
                  }
                });
              },
              onDeleted: () {
                if (selectedSkills.contains("Figma")) {
                  selectedSkills.remove("Figma");
                }
              },
            ),
          ],
        )
      ]),
    );
  }
}
