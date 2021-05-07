import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/todoey/models/task_data.dart';
import 'package:get/get.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback,this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          color: Colors.black,
          //데코리에션 : 텍스트데코레이션 해당 텍스트를 가운데 줄로 쳐버림
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        // onChanged: toggleCheckBoxState
      ),
    );
  }
}
