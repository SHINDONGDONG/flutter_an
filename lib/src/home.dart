import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
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
            ],
          ),
        ),
      ),
    );
  }
}
