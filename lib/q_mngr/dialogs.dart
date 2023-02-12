import 'package:daily_query/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../query.dart';
import '../state.dart';

class ModificationDialog extends StatefulWidget {
  const ModificationDialog({Key? key, required this.question})
      : super(key: key);

  final Question question;
  @override
  State<ModificationDialog> createState() => _ModificationDialogState();
}

class _ModificationDialogState extends State<ModificationDialog> {
  String currentType = "";
  @override
  void initState() {
    currentType = widget.question.type;
    super.initState();
  }

  // TODO: Make this more uniform with the NewthingDialog
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            const Text("title"),
            const TextField(),
            Row(
              children: [
                DropdownButton(
                  value: currentType,
                  underline: null,
                  hint: const Text("Choose Type"),

                  // When is "Amount" going to be used???
                  items: kQuestionTypes
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      currentType = value as String;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NewQuestionDialog extends StatefulWidget {
  const NewQuestionDialog({Key? key}) : super(key: key);

  @override
  _NewQuestionDialogState createState() => _NewQuestionDialogState();
}

class _NewQuestionDialogState extends State<NewQuestionDialog> {
  String? currentType;

  String questionText = "";
  String description = "";

  // TODO: Make both of these prettier
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Text(
              "New Question",
              style: GoogleFonts.rubikIso(
                  fontSize: 30.0, fontWeight: FontWeight.w900),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Question Title",
              ),
              onChanged: (str) {
                questionText = str;
              },
            ),
            Row(
              children: [
                DropdownButton(
                  value: currentType,
                  underline: null,
                  hint: Text(
                    "Choose Type!",
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  dropdownColor: Colors.white,
                  // When is "Amount" going to be used???
                  items: kQuestionTypes
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      currentType = value as String;
                    });
                  },
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(hintText: "Description"),
              onChanged: (str) {
                description = str;
              },
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<QuestionListProvider>(context, listen: false)
                        .addQuestion(questionText, description, currentType!);
                    Navigator.pop(context);
                  },
                  child: const Text("Create"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
