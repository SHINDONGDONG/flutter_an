import 'package:flutter/material.dart';

class IamPoor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Poor'),
        ),
        body: Center(
          child: Image.asset("assets/images/coalpng.png"),
        ),
      ),
    );
  }
}
