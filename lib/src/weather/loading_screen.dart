import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/weather/Weather.dart';
import 'package:get/get.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  //get 메서드는 향후 response값을 갖는다. 즉, 다시 우리가 얻는 데이터를 유지시키려면
  //새로운 변수를 선언해야함
  void getData() async {//api openweathermap 도메인, 사용할 api 버전/날씨
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': 'Tokyo', //q 쿼리값
      'appid': 'bffdb561d5545e3b15c6b429319d20ed' //내 id
    });
    http.Response response = await http.get(uri);//Response에 uri를 http.get하여 담아주기
    if(response.statusCode ==200 ){ //response의 status가 200 (정상이면)
     var jsonResponse = convert.jsonDecode(response.body); //jsonResponse에 json데이터를 디코더한다.
      print(jsonResponse);
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }



  //deactivate 라이프 사이클은 현 페이지가 종료되었을 때 (라이프사이클이 죽었을때)
  @override
  void deactivate() {
    super.deactivate();
    print('종료했다');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()=>Get.to(()=>Weather()),
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
