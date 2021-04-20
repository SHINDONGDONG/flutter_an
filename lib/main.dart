import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/ask.dart';
import 'package:flutter_youtube/src/dice.dart';
import 'package:flutter_youtube/src/quizzler.dart';
import 'package:flutter_youtube/src/xylophone.dart';
import 'package:get/get.dart';
import 'src/bmi_cal/bmi_cal.dart';
import 'src/destini.dart';
import 'src/home.dart';
import 'src/i_am_poor.dart';
import 'src/iam_rich.dart';
import 'src/mi_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //dark 테마에서 옵션으로 넣을 수 있음 혁명적!!
      theme:ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0E1020), //앱바,탭바,툴바 등
        scaffoldBackgroundColor: Color(0xFF0E1020),
        //텍스트 띰으로 바디쪽 제어
        // textTheme: TextTheme(
        //   body1: TextStyle(color: Colors.white),
        // ),
        accentColor: Colors.purple,

      ),
        //스캐폴드가 들어간 위젯은 모두 블루그레이로 바꿔준다.
        // scaffoldBackgroundColor: Colors.blueGrey,
        //   //앱바의 모든 색상을 블루그레이900으로 바꿔준다.
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.blueGrey[900],
        // )
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>Home()),
        GetPage(name: "/rich", page: ()=>IamRich()),
        GetPage(name: "/poor", page: ()=>IamPoor()),
        GetPage(name: "/card", page: ()=>MiCard()),
        GetPage(name: "/dice", page: ()=>Dice()),
        GetPage(name: "/ask", page: ()=>Ask()),
        GetPage(name: "/xylophone", page: ()=>Xylophone()),
        GetPage(name: "/quizzler", page: ()=>Quizzler()),
        GetPage(name: "/destini", page: ()=>Destini()),
        GetPage(name: "/bmi", page: ()=>BmiCal()),
      ],
    );
  }
}


