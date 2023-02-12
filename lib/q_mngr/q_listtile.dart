import 'package:daily_query/q_mngr/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:daily_query/query.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    this.initiallyEditMode = false,
  }) : super(key: key);

  final Question question;

  final bool initiallyEditMode;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String currentType = "";

  @override
  void initState() {
    // TODO: implement initState
    currentType = widget.question.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${widget.question.id} ${widget.question.questionText}",
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    currentType,
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ModificationDialog(question: widget.question);
                        },
                      );
                    },
                    style: const ButtonStyle(),
                    child: const Text("Modify"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
