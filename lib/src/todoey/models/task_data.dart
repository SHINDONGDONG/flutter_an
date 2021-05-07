import 'dart:collection';

import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [];

  int get taskCount{
    return _tasks.length;
  }

  //외부에서 수정을 하려고할 때 에러가남
  UnmodifiableListView<Task> get getTask {
    return UnmodifiableListView(_tasks);
  }

  void addTitle(String newTitle){
    final task = Task(name: newTitle);
    _tasks.add(task);
    notifyListeners();
  }

}