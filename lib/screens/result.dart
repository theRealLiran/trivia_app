import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TriviaResultScreen extends StatelessWidget {
  final bool isAnsweredCorrect;
  final Function onRefreshTap;
  const TriviaResultScreen({Key key, this.isAnsweredCorrect, this.onRefreshTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isAnsweredCorrect
                  ? Icons.check_circle_outline
                  : Icons.cancel_outlined,
              color: isAnsweredCorrect ? Colors.green : Colors.red,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                isAnsweredCorrect ? "You got it !!!" : "Try again !!!",
                style: TextStyle(
                    fontSize: 26, fontFamily: GoogleFonts.ubuntu().fontFamily),
              ),
            ),
            ElevatedButton(
              child: Icon(Icons.refresh, size: 22),
              onPressed: onRefreshTap,
            ),
          ],
        ),
      ),
    );
  }
}
