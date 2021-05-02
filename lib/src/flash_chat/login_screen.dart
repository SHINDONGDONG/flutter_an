import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Center(
            child: Column(
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
                    onChanged: (value) {
                      print(value);
                    },
                    style: TextStyle(color: Colors.black),
                    maxLength: 15,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'ID',
                      labelText: 'ID',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      border: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      disabledBorder: buildOutlineInputBorder(),
                      focusedBorder: buildOutlineInputBorder(),
                      focusedErrorBorder: buildOutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    onChanged: (value) {
                      print(value);
                    },
                    style: TextStyle(color: Colors.black),
                    obscureText: _hidePass,
                    decoration: InputDecoration(
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Password',
                      labelText: 'Password',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      border: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      disabledBorder: buildOutlineInputBorder(),
                      focusedBorder: buildOutlineInputBorder(),
                      focusedErrorBorder: buildOutlineInputBorder(),
                    ),
                  ),
                ),
              ],
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
}
