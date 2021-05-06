import 'package:flutter/material.dart';

import 'screen/task_screen.dart';

class TodoeyMain extends StatelessWidget {
  static final id = 'todoey'; //route id를 선언해주기
  @override
  Widget build(BuildContext context) {
    return TaskScreen();
  }
}
