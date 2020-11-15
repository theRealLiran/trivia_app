import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TriviaQuestionScreen extends StatelessWidget {
  final String question;
  final List<String> answers;
  final ValueChanged<int> onAnswerTap;
  const TriviaQuestionScreen(
      {Key key, this.question, this.answers, this.onAnswerTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            question,
            style: TextStyle(
              fontSize: 30,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ListView.builder(
          itemCount: answers.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
            child: AnswerBuilder(
              answer: answers[index].trim().split(".")[1],
            ),
            onTap: () => onAnswerTap(index + 1),
          ),
        ),
      ],
    );
  }
}

class AnswerBuilder extends StatelessWidget {
  final String answer;
  const AnswerBuilder({Key key, this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(answer,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.raleway().fontFamily,
            )));
  }
}
