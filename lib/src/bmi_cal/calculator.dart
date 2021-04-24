import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/bmi_cal/calculator_brain.dart';
import 'package:flutter_youtube/src/bmi_cal/components/buttom_button.dart';
import 'package:flutter_youtube/src/bmi_cal/input_page.dart';
import 'package:get/get.dart';
import 'components/constatns.dart';

// ignore: must_be_immutable
class Calculator extends StatelessWidget {
  Calculator({this.resultBmi,this.resultText,  this.inter});
  final String resultBmi;
  final String resultText;
  final String inter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultBmi,
                  style: kResultStyle,
                  ),
                  Text(
                    resultBmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    inter,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
                  BottomButton(onTap: (){Get.back();},buttonTitle: 'RE-CALCULATOR',),
        ],
      ),
    );
  }
}
