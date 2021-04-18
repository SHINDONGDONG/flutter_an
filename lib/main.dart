import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      theme: ThemeData(
        //스캐폴드가 들어간 위젯은 모두 블루그레이로 바꿔준다.
        scaffoldBackgroundColor: Colors.blueGrey,
          //앱바의 모든 색상을 블루그레이900으로 바꿔준다.
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900],
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>Home()),
        GetPage(name: "/rich", page: ()=>IamRich()),
        GetPage(name: "/poor", page: ()=>IamPoor()),
        GetPage(name: "/card", page: ()=>MiCard()),
      ],
    );
  }
}


