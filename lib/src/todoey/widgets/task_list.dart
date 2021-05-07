import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/todoey/models/task.dart';
import 'package:flutter_youtube/src/todoey/models/task_data.dart';
import 'package:flutter_youtube/src/todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    //컨슈머는 소비자 위젯이 변경사항수신하는 위젯임.
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.getTask[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState){
                taskData.updateTask(task);
              },
              longPressCallback: () {
              taskData.deleteTask(task);
            },
          );
        },
        );
      },
    );
  }
}
