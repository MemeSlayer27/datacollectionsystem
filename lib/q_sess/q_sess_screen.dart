import 'package:daily_query/query.dart';
import 'package:daily_query/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'q_sess_modules.dart';
import 'q_sess_components.dart';

import 'package:provider/provider.dart';

class QuerySessionScreen extends StatelessWidget {
  const QuerySessionScreen({Key? key, required this.query}) : super(key: key);

  final Query query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Header(),
              const SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: QuestionWidget(
                  query: query,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    Key? key,
    required this.query,
  }) : super(key: key);

  final Query query;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _index = 0;
  double sliderValue = 0.0;

  String finalNotes = "";

  Question get question => widget.query.getQuestionAt(_index);

  bool lastQuestion = false;

  Widget moduleBuilder() {
    var questionType = question.type;

    // "Yes/No", "One to Five", "Time Spent", "Amount"
    switch (questionType) {
      case "Time Spent":
        return SliderModule(
          sliderValue: sliderValue,
          valueDisplayFontSize: 60.0,
          valueDisplayText:
              "${(sliderValue / 4).toInt().toString()}h\n${(15 * (sliderValue % 4).toInt())}min",
          maxValue: 48.0,
          onConfirm: () {
            setState(() {
              if (_index == widget.query.questionCount - 1) {
                lastQuestion = true;
              } else {
                _index++;
              }
              // TODO: make the slidervalue make more sense
              widget.query.addAnswer(question, sliderValue);

              // This one could be animated so that it bounces down
              sliderValue = 0.0;
            });
          },
          onSliderChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        );
      case "One-to-Ten":
        return SliderModule(
          sliderValue: sliderValue,
          valueDisplayFontSize: 160.0,
          valueDisplayText: sliderValue.toInt().toString(),
          maxValue: 10.0,
          onConfirm: () {
            setState(() {
              if (_index == widget.query.questionCount - 1) {
                lastQuestion = true;
              } else {
                _index++;
              }
              // TODO: make the slidervalue make more sense
              widget.query.addAnswer(question, sliderValue);

              // This one could be animated so that it bounces down
              sliderValue = 0.0;
            });
          },
          onSliderChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        );
      case "Amount":
        return SliderModule(
          sliderValue: sliderValue,
          valueDisplayFontSize: 115.0,
          valueDisplayText: sliderValue.toInt().toString(),
          maxValue: 100.0,
          onConfirm: () {
            setState(() {
              if (_index == widget.query.questionCount - 1) {
                lastQuestion = true;
              } else {
                _index++;
              }
              // TODO: make the slidervalue make more sense
              widget.query.addAnswer(question, sliderValue);

              // This one could be animated so that it bounces down
              sliderValue = 0.0;
            });
          },
          onSliderChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        );
      case "Yes/No":
        return YesNoModule(onYes: () {
          setState(
            () {
              if (_index == widget.query.questionCount - 1) {
                lastQuestion = true;
              } else {
                _index++;
              }
            },
          );
          widget.query.addAnswer(question, "yes");
        }, onNo: () {
          setState(
            () {
              if (_index == widget.query.questionCount - 1) {
                lastQuestion = true;
              } else {
                _index++;
              }
            },
          );

          widget.query.addAnswer(question, "no");
        });
      default:
        return const Text("Sussss");
    }
  }

  Widget modulePicker() {
    if (lastQuestion) {
      return AnythingOfNote(
        onChanged: (str) {
          finalNotes = str;
        },
        onFinalize: () {
          widget.query.addNotes([finalNotes]);

          widget.query.finalizeQuery();

          Provider.of<QueryCompletionProvider>(context, listen: false)
              .completeForToday(widget.query.getDate);

          


          Navigator.pop(context);
        },
      );
    } else {
      return moduleBuilder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Q ${lastQuestion ? _index + 2 : _index + 1}/${widget.query.questionCount + 1}",
            style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            lastQuestion ? "Anything of Note" : "${question.questionText}",
            style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w900, fontSize: 30.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          alignment: Alignment.topLeft,
          child: lastQuestion
              ? const SizedBox()
              : Container(
                  alignment: Alignment.centerLeft,
                  child: Text(question.description),
                ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(child: modulePicker()),
      ],
    );
  }
}
