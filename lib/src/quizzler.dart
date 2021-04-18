import 'package:flutter/material.dart';

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> scoreKeeper=[
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];

  List<String> questionList = [
    '저는 잘생겼습니까?',
    '당신은 남자입니까?',
    '기혼자 이십니까?'
  ];

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
                child: Text(questionList[questionNumber],
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
                    if(questionNumber >=3){
                      questionNumber = 0;
                    }else{
                      questionNumber++;
                    }
                  scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,)
                  );
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
                onPressed: (){},
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
          Row(
            children: scoreKeeper,
          )




        ],
      ),
    );
  }
}
