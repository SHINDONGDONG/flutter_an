import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/todoey/models/task.dart';
import 'package:flutter_youtube/src/todoey/models/task_data.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController;
    List<Task> tasks = [];
    String newTask;


    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50,20,50,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: textEditingController,
              onChanged: (newText) {
                newTask = newText;
              },
              autofocus: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
                ),
            TextButton(
              style:
              TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
              onPressed: () {
                final task = Task(name : newTask);
                Provider.of<TaskData>(context,listen: false).addTitle(task.name);
                Get.back();
              },
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
