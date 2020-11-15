import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String message;
  const ErrorState({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
