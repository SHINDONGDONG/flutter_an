import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/bmi_cal/components/constatns.dart';

class BottomButton extends StatelessWidget {

  BottomButton({this.onTap, this.buttonTitle});
  final Function onTap;
  final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: kLargeButtonText,),),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
