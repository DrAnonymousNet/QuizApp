import 'package:flutter/material.dart';



class Result extends StatelessWidget {
  final total_score;
  final VoidCallback reset_quiz;

  String get resultPhrase {
    String result_text;
    if (total_score <= 12) {
      result_text = "Nice one";
    } else if (total_score <= 20) {
      result_text = "Wow thats nice of you";
    } else {
      result_text = "You are fantastic";
    }
    return result_text;
  }

  Result(this.total_score, this.reset_quiz);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "$resultPhrase !, You scored $total_score",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: reset_quiz,
            child: Text("Restart Quiz"),
            style: TextButton.styleFrom(foregroundColor: Colors.orange),
            )
           ],
      ),
    );
  }
}
