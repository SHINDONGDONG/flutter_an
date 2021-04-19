import 'package:flutter/material.dart';

import 'quiz_brain.dart';

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  QuizBrain quizBrain = QuizBrain();

  List<Widget> scoreKeeper=[];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(quizBrain.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    bool currentAnswer = quizBrain.getQuestionAnswer(questionNumber);
                    if(questionNumber ==2){
                      questionNumber = 0;
                      scoreKeeper.add(
                        currentAnswer == true ?
                        Icon(Icons.check, color: Colors.green,):
                        Icon(Icons.close, color: Colors.red,),
                      );
                    }else{
                      if(scoreKeeper.length <3){
                        scoreKeeper.add(
                          currentAnswer == true ?
                          Icon(Icons.check, color: Colors.green,):
                          Icon(Icons.close, color: Colors.red,),
                        );
                      }
                    quizBrain.netxQuestion();
                    }
                  });
                },
                textColor: Colors.white,
                color: Colors.green,
                child: Text('True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    bool currentAnswer = quizBrain.getQuestionAnswer(questionNumber);
                  if(questionNumber ==2 ){
                    questionNumber =0;
                    scoreKeeper.add(
                      currentAnswer == true ?
                      Icon(Icons.check, color: Colors.green,):
                      Icon(Icons.close, color: Colors.red,),
                    );
                  }else{
                    if(scoreKeeper.length <3){
                  scoreKeeper.add(
                    currentAnswer == false ?
                    Icon(Icons.check, color: Colors.green,):
                    Icon(Icons.close, color: Colors.red,),
                  );
                    }
                    quizBrain.netxQuestion();
                  }
                  });
                },
                color: Colors.red,
                child: Text('False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          //TODO: add score
          Wrap(
            children: [
            Row(
              children: scoreKeeper,
            ),
            ],
          )
        ],
      ),
    );
  }
}
