import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_youtube/src/coinTiker/price_screen.dart';
import 'package:get/get.dart';

class CoinMain extends StatefulWidget {
  @override
  _CoinMainState createState() => _CoinMainState();
}

class _CoinMainState extends State<CoinMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),
            ()=>Get.to(()=>PriceScreen()));
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: SpinKitWave(
            color: Colors.blueAccent,
            size: 50,
          ),
        ),
      ),
    );
  }
}
