import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/flash_chat/login_screen.dart';
import 'package:flutter_youtube/src/flash_chat/welcome_screen.dart';
import 'package:get/get.dart';


class ChatMain extends StatelessWidget {

  static String id = 'loginscreen';

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
