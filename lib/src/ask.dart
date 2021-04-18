import 'dart:math';

import 'package:flutter/material.dart';

class Ask extends StatefulWidget {
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: (){
              setState(() {
                ballNumber = Random().nextInt(5)+1;
              });
            },
            child: Image.asset("assets/images/ball${ballNumber}.png"),

          ),
        ),
      ),
    );
  }
}
