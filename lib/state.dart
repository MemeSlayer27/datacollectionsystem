import 'dart:math';

import 'package:flutter/material.dart';
import 'query.dart';

/// This class should keep score of daily completion.
/// Query can be done only once a day. 
///
/// The provider part here just makes it completed for the day after completion.
class QueryCompletionProvider with ChangeNotifier {
  bool completedToday = false;

  DateTime dateOfLastCompletion = DateTime.now();

  void completeForToday(DateTime date) {
    // TODO: Should also take the answers as a parameter and save them to a local db,
    dateOfLastCompletion = date;
  }
}


class QuestionListProvider with ChangeNotifier {
  //TODO: make these come from a db
  List<Question> questions = [
    Question(
      id: 1,
      questionText: "Vigorous Exercise",
      description:
          "How many hours of intentional and high-intensity exercise did I do today?",
      type: "Time Spent",
    ),
    Question(
      id: 2,
      questionText: "Focused hours",
      description: "How many hours did I spend deeply focused?",
      type: "Time Spent",
    ),
  ];

  List<Question> getQuestions() {
    return questions;
  }

  void addQuestion(String questionText, String description, String type) {
    int biggestSoFar = questions.map((e) => e.id).reduce(max);
    int id = biggestSoFar + 1;

    var q = Question(
      id: id,
      questionText: questionText,
      description: description,
      type: type,
    );

    questions.add(q);

    // TODO: Make this use the db
    notifyListeners();
  }

  void modifyQuestion() {}

  void deleteQuestion() {}
}
