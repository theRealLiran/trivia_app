class TriviaModel {
  String question;
  List<String> answers;
  int correctAnswer;

  TriviaModel({this.question, this.answers, this.correctAnswer});

  factory TriviaModel.formJson(Map<String, dynamic> json) {
    return TriviaModel(
      question: json['question'],
      answers: json['answers'],
      correctAnswer: json['answer'],
    );
  }
}
