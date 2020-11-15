import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/data/data_provider.dart';
import 'package:trivia_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TriviaProvider(
        triviaList: [],
        userSelectedAnswer: null,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trivia App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TriviaHome(),
      ),
    );
  }
}
