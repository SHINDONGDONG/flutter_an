import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/bmi_cal/calculator.dart';
import 'package:flutter_youtube/src/bmi_cal/calculator_brain.dart';
import 'package:flutter_youtube/src/bmi_cal/components/enum.dart';
import 'package:flutter_youtube/src/bmi_cal/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'components/buttom_button.dart';
import 'components/constatns.dart';
import 'calculator_brain.dart';

class BmiCal extends StatefulWidget {
  @override
  _BmiCalState createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  Gender selectedGender;
  double longStart = 0;
  double longEnd = 200.0;
  int long = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false, //뒤로가기 버튼없앰
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kActiveColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //텍스트 베이스라인을 지정해주고
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    //텍스트 베이스라인을 알바베틱으로 해준다.
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        long.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                  //슬라이더 띰 에서 데이터를 copyWith으로 (우리가 설정했던
                  //dark를 extends 받아와서 copyWith..
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: kBottomContainerColor.withOpacity(0.3),
                      thumbShape: RoundSliderThumbShape(
                        //슬라이더의 동그란 컨트롤러
                        enabledThumbRadius: 15, //15크기로
                      ),
                      //오버레이는 슬라이더의 콘트롤러를 만지고잇을때 주변에 희미하게
                      //보여지는 애니메이션
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: long.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (value) {
                        setState(() {
                          //인트값이라 더블값을 반올림한다.
                          long = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          // ReuseableCard(color: Color(0xFF1D1E33),size: size,width: 1,height:0.3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  child: ReuseableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                CalculatorBrain cal = CalculatorBrain(height: long,weight: weight);
                                print(cal.calculateBMI());
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveColor,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: ReuseableCard(
                    cardChild: Column(
                      children: [
                        Text('AGE',style: TextStyle(color: Colors.white.withOpacity(0.5),),),
                        Text(age.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveColor,
                  ),
                ),
              ),
            ],
          ),
          BottomButton(onTap:(){
            CalculatorBrain cal = CalculatorBrain(height: long,weight: weight);
            Get.to(Calculator(car: cal));},
            buttonTitle: 'Calculator',),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      //버튼의 모양은 서클보더로 동그랗게
      shape: CircleBorder(),
      // shape:RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10)
      // ) ,
      //버튼의 컬러
      fillColor: Colors.grey.withOpacity(0.3),
      //constraints 박스의 크기를 지정해주기
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
    );
  }
}
