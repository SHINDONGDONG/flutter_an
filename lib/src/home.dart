import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/controller/navigation_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final navigatorController = Get.put(NavigationCotroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {Get.toNamed("/rich");}, child: Text('I\'am Rich'),),
              ElevatedButton(onPressed: () {Get.toNamed("/poor");}, child: Text('I\'am Poor'),),
              ElevatedButton(onPressed: () {Get.toNamed("/card");}, child: Text('Mi Card'),),
              ElevatedButton(onPressed: () {Get.toNamed("/dice");}, child: Text('Dice'),),
              ElevatedButton(onPressed: () {Get.toNamed("/ask");}, child: Text('Ask'),),
              ElevatedButton(onPressed: () {Get.toNamed("/xylophone");}, child: Text('Xylophone'),),
              ElevatedButton(onPressed: () {Get.toNamed("/quizzler");}, child: Text('Quizzler'),),
              ElevatedButton(onPressed: () {Get.toNamed("/destini");}, child: Text('Destini'),),
              ElevatedButton(onPressed: () {Get.toNamed("/bmi");}, child: Text('BmiCal'),),
              ElevatedButton(onPressed: () {Get.toNamed("/weather");}, child: Text('Weather'),),
              ElevatedButton(onPressed: () {Get.toNamed("/coin");}, child: Text('Coin'),),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
}
