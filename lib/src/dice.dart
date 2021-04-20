import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 2;

  void changeDiceFace() {
    setState(() {
    leftDiceNumber = Random().nextInt(6)+1;
    rightDiceNumber = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextButton(
                      onPressed: (){
                          changeDiceFace();
                        print(leftDiceNumber);
                      },
                      child: Image.asset(
                  "assets/images/dice$leftDiceNumber.png",
                ),
                    )),
                Expanded(
                    child: TextButton(
                      onPressed: (){
                          changeDiceFace();
                      },
                      child: Image.asset(
                  "assets/images/dice$rightDiceNumber.png",
                ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
