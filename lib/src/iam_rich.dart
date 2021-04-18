import 'package:flutter/material.dart';

class IamRich extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //scaffold는 비계 (겉면을 감싸고있는 위젯)
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('I am Rich'),
      ),

      body: Center(
        child: Column(
          children: [
            // //Network로 불러오는 Images
            // Image.network(
            //     "https://upload.wikimedia.org/wikipedia/ko/c/cd/Doraemon.PNG"),
            Image.asset("assets/images/diamond.png",),
          ],
        ),
      ),
    );
  }
}
