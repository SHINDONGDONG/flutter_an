import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(title: 'Egg',),
        TaskTile(title: 'Milk',),
        TaskTile(title: 'ice',),
      ],
    );
  }
}
