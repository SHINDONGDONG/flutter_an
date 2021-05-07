import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/todoey/models/task.dart';
import 'package:flutter_youtube/src/todoey/models/task_data.dart';
import 'package:flutter_youtube/src/todoey/widgets/task_list.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      child: Center(
        child: Text('bottom'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          //애니메이션과 함께나오는 바텀시트
          showModalBottomSheet(
            //바텀시트가 올라왔을때 흐려지는 색상임.
            backgroundColor: Color(0xff757575),
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Provider.of<TaskData>(context).taskCount == 0
                  ? Center(
                      child: Text(
                        '일정을 등록해 주세요',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
