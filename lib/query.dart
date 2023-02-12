class Query {
  /// Handles the business logic for the queries.
  /// Records the answers, and sends them to the server once complete.
  /// Also needs to get the date in order to make sure
  ///
  Query({required this.questionList});

  List<Question> questionList;

  final DateTime _date = DateTime.now();

  final List<Answer> _answers = [];
  final List<String> _notes = [];

  Question getQuestionAt(int index) => questionList[index];

  int get questionCount => questionList.length;

  DateTime get getDate => _date;

  void addAnswer(Question question, dynamic answer) {
    Answer answerObjext = Answer(
      questionId: question.id,
      type: question.type,
      answer: answer,
      date: _date,
    );

    _answers.add(answerObjext);
  }

  void addNotes(List<String> notesList) {
    for (var element in notesList) {
      _notes.add(element);
    }
  }

  void finalizeQuery() {
    //TODO: Make this send the results to the server
    print(_answers);
    print(_notes);
  }
}

class Question {
  Question({
    required this.id,
    this.isActive = true,
    required this.questionText,
    required this.type,
    required this.description,
  });

  int id;
  bool isActive;
  String type;
  String questionText;
  String description;
}


class Answer {
  final int _biggestIdSoFar = 3;
  int get id => _biggestIdSoFar + 1;

  Answer({
    required this.questionId,
    required this.type,
    required this.answer,
    required this.date,
  });

  int questionId;
  String type;
  DateTime date;
  dynamic answer;
}
