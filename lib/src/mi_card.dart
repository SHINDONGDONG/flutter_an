import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //스캐폴드의 색상을 red로 준상태에서 컨테이너에게 색상을줘보자
      backgroundColor: Colors.teal,
      //컨테이너는 사용가능한 모든 공간을 차지함
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //컨트롤 + Q 누르면 사용할 수 있는 인자값볼수잇음
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/8f/8f/f9/8f8ff9056f2c8a64117bc1835465c41c.jpg"),
            ),
            Text(
              'Micheal',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontSize: 15,
                //컬러에 쉐이드를 넣으면 흐릿하게 할 수 있다.
                color: Colors.teal.shade100,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'ZenDots',
              ),
            ),
            SizedBox(
              width: 150,
              height: 20,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.teal,
                ),
                title: Text(
                  '+44 1234 1234',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'ZenDots',
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'hoaaa@gmail.com',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'ZenDots',
                  ),
                ),
              ),
            ),
/*            Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                    SizedBox(width: 10,),
                    Text('44 1234 1234',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'ZenDots',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.teal.shade900,
                    ),
                    SizedBox(width: 10,),
                    Text('homerjay@naver.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'ZenDots',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
          ],

          /*
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //verticalDirection.up 은 밑에서부터 컬럼생성
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  // margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 100,
                  color: Colors.red,
                  //컨테이너에 자식이 생기면 자식만큼의 공간을 차지하게됨.
                  //즉 (aaa)만큼의 파란색, 이외는 빨간색이 차지하게됨
                  child: Text('Container 1'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                      //컨테이너에 자식이 생기면 자식만큼의 공간을 차지하게됨.
                      //즉 (aaa)만큼의 파란색, 이외는 빨간색이 차지하게됨
                      child: Text('Container 2'),
                    ),
                    Container(
                      // margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      //컨테이너에 자식이 생기면 자식만큼의 공간을 차지하게됨.
                      //즉 (aaa)만큼의 파란색, 이외는 빨간색이 차지하게됨
                      child: Text('Container 2'),
                    ),
                  ],
                ),
                Container(
                  // margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 100,
                  color: Colors.blue,
                  //컨테이너에 자식이 생기면 자식만큼의 공간을 차지하게됨.
                  //즉 (aaa)만큼의 파란색, 이외는 빨간색이 차지하게됨
                  child: Text('Container 3'),
                ),
              ],
            ),
*/
        ),
      )),
    );
  }
}
