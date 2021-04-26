import 'package:flutter/material.dart';

class Weather extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String myMargin = '15';
    double myMarginAsADouble;

    try{
      //myMargin을 더블값으로 변환중에
      myMarginAsADouble = double.parse(myMargin);
    }catch(e){
     //에러가 생기면
     print(e); //에러를 출력
    }

    return Scaffold(
      body: Container(
                        //myMargin이 변환한 값이 null이면 null대신 30.0을 반환하세요
        margin: EdgeInsets.all(myMarginAsADouble ?? 30.0),
        color: Colors.red,
      ),
    );
  }
}
