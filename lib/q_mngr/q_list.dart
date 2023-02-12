import 'package:daily_query/q_mngr/q_listtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  // in the future, these should be fetched from a local db or from server.
  // Most likely a local db

  List<QuestionWidget> get questionWidgets {
    var questions = Provider.of<QuestionListProvider>(context).questions;

    return questions.map((q) => QuestionWidget(question: q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Center(
        child: SizedBox(),
      ),
      padding: const EdgeInsets.all(20.0),
      itemCount: questionWidgets.length,
      itemBuilder: (context, index) {
        return questionWidgets[index];
      },
    );
  }
}
