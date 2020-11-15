import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/data/data_provider.dart';
import 'package:trivia_app/data/model.dart';
import 'package:trivia_app/screens/error.dart';
import 'package:trivia_app/screens/question.dart';
import 'package:trivia_app/screens/result.dart';

class TriviaHome extends StatefulWidget {
  const TriviaHome({Key key}) : super(key: key);

  @override
  _TriviaHomeState createState() => _TriviaHomeState();
}

class _TriviaHomeState extends State<TriviaHome> {
  Future<TriviaModel> fetchData;
  int pageIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData =
        Provider.of<TriviaProvider>(context, listen: false).getRandomTrvia();
  }

  @override
  Widget build(BuildContext context) {
    print('building...');
    return Scaffold(
      body: FutureBuilder<TriviaModel>(
        future: fetchData,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.none:
              return ErrorState(message: 'Connection State error');

            default:
              if (snapshot.hasError) {
                return ErrorState(message: 'Snapshot error');
              } else {
                return IndexedStack(
                  index: pageIndex,
                  children: [
                    TriviaQuestionScreen(
                        question: snapshot.data.question,
                        answers: snapshot.data.answers,
                        onAnswerTap: (value) {
                          Provider.of<TriviaProvider>(context, listen: false)
                              .updateAnswer(value);

                          setState(() {
                            pageIndex = 1;
                          });
                        }),
                    Consumer<TriviaProvider>(
                      builder: (context, triviaProvider, child) =>
                          TriviaResultScreen(
                        isAnsweredCorrect: triviaProvider.userSelectedAnswer ==
                            snapshot.data.correctAnswer,
                        onRefreshTap: () {
                          setState(() {
                            pageIndex = 0;
                          });
                        },
                      ),
                    ),
                  ],
                );
              }
          }
        },
      ),
    );
  }
}
