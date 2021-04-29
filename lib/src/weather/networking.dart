import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper{

  NetworkHelper(this.url);

  final Uri url;

  //Network부분만 따로 빼놓아 리팩토링 한다.
  Future getData() async {
    http.Response response = await http.get(url);//Response에 uri를 http.get하여 담아주기
    if(response.statusCode ==200 ){ //response의 status가 200 (정상이면)
      dynamic data = convert.jsonDecode(response.body);
      return data;
    }else{
      print(response.statusCode);
    }
  }
}