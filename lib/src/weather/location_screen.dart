import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/weather/Weather.dart';
import 'package:flutter_youtube/src/weather/constatns.dart';

class LocationScreen extends StatefulWidget {
  //Loading화면에서 데이터를 넘겨받아온다 (생성자로)
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  int condition;
  String cityName;
  String weatherMessage;
  String weatherIcon;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
    //켈빈 온도를 -> 섭씨온도로 변경
    //켈빈온도- 절대온도(273.15) = 섭씨온도
    print(condition);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
    //double로 받은 온도를
    double temp = weatherData['main']['temp'];
    //인트로 선언한 temperature 에 넣어준다(toint)
    temperature = temp.toInt();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    WeatherModel weatherModel = WeatherModel();
    weatherMessage = weatherModel.getMessage(temperature);
    weatherIcon = weatherModel.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUi(weatherData);
                      },
                      icon: Icon(
                        Icons.near_me,
                        size: 50,

                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_city,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(weatherIcon,style: kMessageTextStyle,),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '$weatherMessage and $cityName',
                  style: kMessageTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



