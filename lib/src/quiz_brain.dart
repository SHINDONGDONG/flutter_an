import 'package:flutter_youtube/src/question.dart';

class QuizBrain{
  int _questNumber = 0;

  List<Question> _questionBank  = [
    Question(questionText: '저는 잘생겼습니까?',questionAnswer: true),
    Question( questionText: '당신은 남자입니까?',questionAnswer: true),
    Question(questionText: '기혼자 이십니까?',questionAnswer: false),

  ];

    void netxQuestion(){
      if(_questNumber < _questionBank.length -1){
        _questNumber++;
      }
    }

    String getQuestionText(int questNumber){
      return _questionBank[_questNumber].questionText;
    }
    bool getQuestionAnswer(int questNumber){
      return _questionBank[_questNumber].questionAnswer;
    }
}