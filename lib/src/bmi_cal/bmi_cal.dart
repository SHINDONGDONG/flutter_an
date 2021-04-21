import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/bmi_cal/enum.dart';
import 'package:flutter_youtube/src/bmi_cal/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constatns.dart';

class BmiCal extends StatefulWidget {
  @override
  _BmiCalState createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {

  Gender selectedGender;
  double longStart = 0;
  double longEnd = 200.0;
  int long = 180;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

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
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  color: selectedGender ==Gender.male ?
                  kActiveColor : kInActiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars,
                    label: 'Male',),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender ==Gender.female ?
                  kActiveColor : kInActiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus,
                    label: 'Female',),
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
                    'HEIGHT',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //텍스트 베이스라인을 지정해주고
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    //텍스트 베이스라인을 알바베틱으로 해준다.
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(long.toString(),
                        style:kNumberStyle,
                      ),
                      Text('cm',style: TextStyle(fontSize:19),),
                    ],
                  ),
                  Slider(
                    value: long.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: kBottomContainerColor,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (value) {
                      setState(() {
                        //인트값이라 더블값을 반올림한다.
                        long = value.round();
                      });
                  },)
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
                    color: kActiveColor,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: ReuseableCard(
                    color: kActiveColor,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: kBottomContainerHeight,
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}