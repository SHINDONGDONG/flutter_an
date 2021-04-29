import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/weather/location.dart';
import 'package:flutter_youtube/src/weather/networking.dart';


const apiKey = 'bffdb561d5545e3b15c6b429319d20ed';
const openWeatherUrl1 ='api.openweathermap.org';
const openWeatherUrl2 = '/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    //로케이션 위,경도를 직접입력하여 리팩토링
    // latitude = location.latitude;
    // longitude = location.longitude;

    //네트워크 헬퍼로 따로뺴놓고 코드를 간결하게 리팩토링한다.
    NetworkHelper networkHelper = NetworkHelper(
        Uri.https(openWeatherUrl1,openWeatherUrl2,{
          // "lat": '37.557396979663906',
          // "lon": '126.9840492401842',
          "lat": '${location.latitude}',
          "lon": '${location.longitude}',
          "units" : 'metric',     //units 를 metirc으로 추가해주면 섭씨로 변함
          "appid": apiKey //내 id
        }));

    var weatherData = await networkHelper.getData();
    return weatherData;

  }


    String getWeatherIcon(int condition) {
      if (condition < 300) {
        return '☁';
      }else if(condition < 400){
        return '🌨';
      }else if(condition < 600){
        return '☔';
      }else if(condition < 700){
        return '☃';
      }else if(condition < 800){
        return '🌪';
      }else if(condition == 800){
        return '☀';
      }else if(condition <= 804){
        return '🌨';
      } else{
        return '🌊';
      }
    }
    String getMessage(int temp){
      if(temp > 25){
        return 'It\'s 🍔 time!';
      }else if(temp > 20){
        return 'Time for shirts and ✈';
      }else if(temp < 10){
        return 'You Well need 장갑';
      }else{
        return 'Bring ⛱ just in case';
      }
    }

}
