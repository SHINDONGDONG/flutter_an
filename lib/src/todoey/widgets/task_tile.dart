import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {

  final String title;
  const TaskTile({Key key, this.title}) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkboxCallback (bool checkBoxState){  //스테이터스 콜백함수.
    setState(() {
      isChecked = checkBoxState;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.black,
        //데코리에션 : 텍스트데코레이션 해당 텍스트를 가운데 줄로 쳐버림
        decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: TaskCheckBox(checkBoxState: isChecked,toggleCheckBoxState: checkboxCallback,),
    );
  }
}
class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final Function toggleCheckBoxState;

  const TaskCheckBox({Key key, this.checkBoxState,this.toggleCheckBoxState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleCheckBoxState
    );
  }
}



