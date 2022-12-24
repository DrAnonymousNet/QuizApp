import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import './question.dart';
import './answer.dart';

/*
final List<int> numbers = List.generate(9, (index) => index);
final List<String> operators = ["+", "-", "*", "-"];
final List<String> special = ["0", "=", "C", "Del"];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State{
  String output = "";
  String input = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: Text("For Love"),
        padding: EdgeInsets.all(25.0),
        margin: EdgeInsets.all(40),
        color: Colors.blue,
        constraints: BoxConstraints.tightForFinite(
          width: 200,
          height: 100
        ),
        alignment: Alignment.center,
      ) 
        )
    );
  }
}
      
      
     
      Column(
        children:[
          Text(
            input,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              backgroundColor: Colors.black12
            
            ),
          ),
          Text(
            output,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              backgroundColor: Colors.black12
            )),
        Row(children: [
        Column(
          children: [NumberButton(), SpecialButtons()],
        ),
        OperatorButtons()
      ]),
    ])));
  }
}

class NumberButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i in [7, 4, 1])
              ElevatedButton(
                child: Text("$i"),
                onPressed: (() {}),
              )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i in [8, 5, 2])
              ElevatedButton(
                child: Text("$i"),
                onPressed: (() {
                  
                }),
              )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i in [9, 6, 3])
              ElevatedButton(
                child: Text("$i"),
                onPressed: (() {}),
              )
          ],
        )
      ],
    );
  }
}

class SpecialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var item in special)
          ElevatedButton(
            child: Center(child: Text("$item")),
            onPressed: () {},
          )
      ],
    );
  }
}

class OperatorButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in operators)
          ElevatedButton(
            child: Center(child: Text("$item")),
            onPressed: () {},
          )
      ],
    );
  }
}
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _question_index = 0;
  var _total_score = 0;
  var questions = [
    {
      "questionText": "Who will win the world cup?",
      "answers": [
        {"text": "Argentina", "score": 3},
        {"text": "France", "score": 2},
        {"text": "Germany", "score": 4},
        {"text": "Italy", "score": 5}
      ]
    },
    {
      "questionText": "Who will win the golden ball?",
      "answers": [
        {"text": "Messi", "score": 10},
        {"text": "Mbappe", "score": 4},
        {"text": "Emartinex", "score": 3},
        {"text": "Modric", "score": 2}
      ]
    },
    {
      "questionText": "What course are you studying",
      "answers": [
        {"text": "E.Eng", "score": 10},
        {"text": "M.Eng", "score": 4},
        {"text": "C.Eng", "score": 3},
        {"text": "D.Eng", "score": 2}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      this._question_index = 0;
      this._total_score = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      this._question_index += 1;
      this._total_score += score;
    });
    print(this._question_index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DrA App",
      home: Scaffold(
          appBar: AppBar(
            title: Text("DrA Code"),
          ),
          body: (_question_index < questions.length)
              ? Quiz(
                  question_index: this._question_index,
                  answerQuestion: _answerQuestion,
                  questions: this.questions,
                )
              : Result(_total_score, _resetQuiz)),
    );
  }
}
