
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/flash_chat/chat_screen.dart';
import 'package:flutter_youtube/src/flash_chat/compontens.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _hidePass = true;
  bool showSpinner = false;

  void firebaseLogin(){


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: GestureDetector(
          onTap: ()=>FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible( //키보드가 올라오면서 hero로고가 작아짐,(픽셀오류안남)
                    child: Hero(
                      tag: 'Logo',
                      child: Container(
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      maxLength: 30,
                      decoration: kTextFieldBorder(title: 'Email',color: Colors.lightBlueAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
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
                      color: Colors.lightBlueAccent,
                      title: 'Log In',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(!user.isBlank){
                          Get.toNamed(ChatScreen.id);
                          }
                        setState(() { //로그인 성공 이후 showspinner를 false로 바꿔준다,
                          showSpinner = false;
                        });
                        }catch(e){
                          print(e);
                        }
                      },),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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



// InputDecoration(
// suffixIcon: IconButton(
// onPressed: () {
// setState(() {
// _hidePass = !_hidePass;
// });
// },
// icon: _hidePass
// ? Icon(Icons.remove_red_eye, color: Colors.black)
// : Icon(Icons.visibility_off_rounded,
// color: Colors.black),
// ),
// floatingLabelBehavior: FloatingLabelBehavior.always,
// labelStyle: TextStyle(color: Colors.black),
// hintText: 'Password',
// hintStyle: TextStyle(color: Colors.grey),
// labelText: 'Password',
// contentPadding:
// EdgeInsets.symmetric(horizontal: 40, vertical: 15),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30),
// borderSide: BorderSide(color: Colors.lightBlueAccent),
// gapPadding: 5,
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30),
// borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
// gapPadding: 5,
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30),
// borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
// gapPadding: 5,
// ),
// )