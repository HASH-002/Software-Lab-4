import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _result;
  VoidCallback _refreshQuiz;
  Result(this._refreshQuiz, this._result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "You scored - ",
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            Text(
              _result.toString(),
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<CircleBorder>(
                  CircleBorder(
                    //borderRadius: BorderRadius.circular(40.0),
                    side: BorderSide(color: Colors.green.shade900),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.greenAccent.shade400),
              ),
              onPressed: () {
                _refreshQuiz();
              },
              child: Icon(
                Icons.refresh_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
