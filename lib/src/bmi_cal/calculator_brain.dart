import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;


  String calculateBMI(){
                        //pow는 제곱을 뜻한다.
    _bmi = weight / pow(height/100, 2);
            //String값으로 소수점 1까지만 출력
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi > 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }
  String getInter(){
    if(_bmi > 25){
      return '살좀 빼라';
    }else if(_bmi > 18.5){
      return '적당하다';
    }else {
      return '멸치새키 살좀찌워라';
    }
  }

}
