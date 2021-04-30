import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/weather/constatns.dart';
import 'package:get/get.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          constraints: BoxConstraints.expand(),
          //백그라운드 이미지가 차일드를 따라가지 않고 Expand된다.
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/city_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    //변경되는값이 트리거됨
                    onChanged: (value) {
                      cityName = value;
                    },
                    style: TextStyle(
                      color: Colors.black
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_city,color: Colors.white,),
                      // labelText: 'City',
                      hintText: 'Input City Name here',
                      hintStyle: TextStyle(color: Colors.grey),
                      // floatingLabelBehavior: FloatingLabelBehavior.always,
                      filled: true,
                      fillColor: Colors.white,
                      border: kTextInputDecoration
                      ),
                      // contentPadding:
                      //     EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      // border: buildOutlineInputBorder(),
                      // focusedErrorBorder: buildOutlineInputBorder(),
                      // focusedBorder: buildOutlineInputBorder(),
                      // enabledBorder: buildOutlineInputBorder(),
                      // disabledBorder: buildOutlineInputBorder(),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    Get.back(result: cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.black),
      gapPadding: 10,

    );
  }
}
