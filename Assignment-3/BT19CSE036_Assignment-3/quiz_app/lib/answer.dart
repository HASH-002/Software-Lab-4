import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback _onPress;
  final String _answerString;

  Answer(this._onPress, this._answerString) {
    print(_answerString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blue.shade900),
        ),
        child: Text(this._answerString),
        onPressed: _onPress,
      ),
    );
  }
}
