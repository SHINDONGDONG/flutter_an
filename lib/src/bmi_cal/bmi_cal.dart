import 'package:flutter/material.dart';

class BmiCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false, //뒤로가기 버튼없앰
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildContainer(size,0.4,0.25),
              buildContainer(size,0.4,0.25),
            ],
          ),
              buildContainer(size,1,0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildContainer(size,0.4,0.25),
              buildContainer(size,0.4,0.25),
            ],
          ),
        ],

      ),
    );
  }

  Widget buildContainer(Size size,double width,double height) {
    return Expanded(
      child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                color: Color(0xFF1D1E33),
                ),
                width: size.width *width,
                height: size.height * height,
              ),
    );
  }
}
