import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/weather/Weather.dart';
import 'package:flutter_youtube/src/weather/location_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = 'bffdb561d5545e3b15c6b429319d20ed';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

  //get 메서드는 향후 response값을 갖는다. 즉, 다시 우리가 얻는 데이터를 유지시키려면
  //새로운 변수를 선언해야함
 /* void getData() async {//api openweathermap 도메인, 사용할 api 버전/날씨

    // http.Response response = await http.get(uri);//Response에 uri를 http.get하여 담아주기
      var cityName = jsondecoder['name'];
      var temp = jsondecoder['main']['temp'];
      var condition = jsondecoder['weather'][0]['id'];
      print('latitude : $latitude , longitude: $longitude');
      print(jsondecoder);
    }
  }*/

  
  //로케이션 데이터를 받고 networkhelper에 인자를 넘겨준다.
  //넘겨준 인자를 받은 netwrokhelper의 getdata를 다시 가져온다.
  //이후 locationScreen으로 이동시켜줌
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    //locationScreen으로 이동시켜줄때 networkhelper에서 가져온 데이터를 인자로 넘겨줌
    Get.to(()=>LocationScreen(locationWeather: weatherData,),);

  }

  @override
  void initState() {
    super.initState();
    getLocationData();
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
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}



