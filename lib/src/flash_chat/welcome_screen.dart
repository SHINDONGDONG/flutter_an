import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/flash_chat/login_screen.dart';
import 'package:flutter_youtube/src/flash_chat/registration_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';



  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animationTween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1), //1초간 애니메이션 지속시간
        vsync: this,
        // upperBound: 60   //50으로 설정하면 컨트롤러의 밸류값이 50이되면 멈춤
    );
    controller.forward(); //0~60까지의 티커를 가지게됨
    // controller.reverse(from: 1); //60~0까지의 티커를 가지게됨 (반대로됨)
    controller.addListener(() {   //리스너 (결과)에다가
      setState(() {});            //setstate를 넘겨 실시간 반영이 되게끔만든다.
      print(animation.value);
    });

/*    controller.addStatusListener((status) {  //status로 애니메이션의 시작,끝을 알수있음
      if(status == AnimationStatus.completed){    //끝나면
        controller.reverse(from: 1);       //1까지 줄인다,
      }else if(status == AnimationStatus.dismissed){ //해지되면
        controller.forward(); //0~60까지의 티커를 실행
      }
    });*/
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut); //parent는 적용대상할 애니메 컨트롤러

    //컬러트윈 애니메이션 비긴,엔드를 지정하고 .animate로 컨트롤러를 지정해주어야함.
    animationTween = ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationTween.value,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'Logo',
                      child: Container(
                        child: Image.asset(
                          "assets/images/logo.png",
                          // height: animation.value * 90,
                          height: 60,
                        ),
                      ),
                    ),
                    Text(
                      'Flash Chat',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  color: Colors.lightBlueAccent,
                  title: 'Log In',
                  onPressed: () => Get.toNamed(LoginScreen.id),
                ),
                ButtonWidget(
                  color: Colors.blueAccent,
                  title: 'Registration',
                  onPressed: () => Get.toNamed(RegistrationScreen.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  ButtonWidget({this.color, this.title, this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: color,
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(title),
          minWidth: 200,
          height: 40,
        ),
      ),
    );
  }
}
