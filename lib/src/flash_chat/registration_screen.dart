import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/flash_chat/chat_screen.dart';
import 'package:flutter_youtube/src/flash_chat/compontens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //auth에 필요한 변수를 지정하기.
  final _auth = FirebaseAuth.instance;

  //true이면 프로그레스가 돌아간다
  bool showSpinner = false;

  //실제로 텍스트필드에 입력한 값을 받을 수 있는 변수를 선언.
  String email;
  String password;

  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        //Scaffold 바디에서 감싸야함 (프로그레스)
        inAsyncCall: showSpinner, //(스피너가 true이면 프로그레스 돌아감)
        child: GestureDetector(
          onTap: ()=>FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'Logo',
                      child: Container(
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 200,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress, //이메일 키보드가 나옴.
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(color: Colors.black),
                        maxLength: 30,
                        decoration: kTextFieldBorder(title: 'Email',color: Colors.lightBlueAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword, //패스워드에 적합한 키보드가 나옴
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(color: Colors.black),
                        obscureText: _hidePass,
                        decoration: kTextFieldBorder(color: Colors.lightBlueAccent,title: 'Password').copyWith(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePass = !_hidePass;
                              });
                            },
                            icon: _hidePass
                                ? Icon(Icons.remove_red_eye, color: Colors.black)
                                : Icon(Icons.visibility_off_rounded,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: ButtonWidget(
                        color: Colors.blueAccent,
                        title: 'Registration',
                        //Registration 버튼을 누르면
                        onPressed: () async {
                          setState(() {
                            //계정생성 버튼을 누르면 true로 변경시켜 프로그레스를 돌린다
                            //이후 navigator가 작동되면 없어짐.
                            showSpinner = true;
                          });
                          //오류가 있을 수 있으므로 try catch문으로 쓰로우를 날려준다/
                          try{
                            //시간이 많이 걸리는 작업일 수 있으니 비동기식으로 날려줌.
                            final newUser =
                            await _auth.createUserWithEmailAndPassword(email: email, password: password);
                            //여기서 아이디가 존재한다면 ChatScreen으로 날려준다.
                            if(newUser != null){
                              Get.toNamed(ChatScreen.id);
                            }
                            //멈춰야하는걸 알려줘야한다.
                            //완료되면 프로그레스 해제 후 스택으로 푸쉬한다.
                            setState(() {
                              showSpinner = false;
                            });
                          }catch(e){
                            print(e);
                          }

                        },),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.lightBlueAccent),
      gapPadding: 5,
    );
  }

  InputDecoration kTextFieldBorder({String title, Color color}) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(color: Colors.black),
      hintText: title,
      hintStyle: TextStyle(color: Colors.grey),
      labelText: title,
      contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: color),
        gapPadding: 5,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: color, width: 1.0),
        gapPadding: 5,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: color, width: 2.0),
        gapPadding: 5,
      ),
    );
  }


}
