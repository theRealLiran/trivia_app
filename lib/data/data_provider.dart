import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/data/model.dart';

class TriviaProvider with ChangeNotifier {
  List<TriviaModel> triviaList = [];
  int userSelectedAnswer;
  TriviaProvider({this.triviaList, this.userSelectedAnswer});

  int get getUserSelectedAnswer => userSelectedAnswer;

  List<TriviaModel> get getTrivia => [...triviaList];

  Future<void> fetchDataFromAPI() async {
    final url = 'http://127.0.0.1:5000/api/v1/trivia/all';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('A network error occurred');
    }

    final data = json.decode(response.body) as List<dynamic>;
    List<TriviaModel> fetchedData = [];

    if (fetchedData == null) {
      triviaList = null;
    }

    data.forEach((value) {
      final trivia = value as Map<String, dynamic>;
      fetchedData.add(TriviaModel(
        question: trivia['question'].split('\n')[0],
        answers: trivia['question']
            .split('\n')
            .getRange(1, trivia['question'].split('\n').length)
            .toList(),
        correctAnswer: trivia['answer'],
      ));
    });

    triviaList = fetchedData.toList();
    notifyListeners();
  }

  Future<TriviaModel> getRandomTrvia() async {
    await fetchDataFromAPI();
    final random = Random();
    final randomTrivia = random.nextInt(triviaList.length);
    return triviaList[randomTrivia];
  }

  void updateAnswer(int answer) {
    userSelectedAnswer = answer;
    notifyListeners();
  }
}
