import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;  //경도 위도의 변수를 지정해준다.
  double longitude;

  //async 비동기식이므로 Future다   //getCurrentLocation을 호출하면 현재 위치를 가지고올 수 있다.
  Future<void> getCurrentLocation() async {//위치를 불러오는 시간이 느려질 수 있기때문에 비동기식처리
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //찾으려는 위치가 정확하면 정확할 수 록 배터리소모가 많아진다.
      //Position 에 Geolocator 패키지 getcurrentPosition을 불러와 locationaccruacy.(위치레벨(하이레벨))
      latitude = position.latitude;
      longitude = position.longitude;

    }catch(e){
      print('position 찾는데 실패 하였습니다 $e');
    }
  }
}
