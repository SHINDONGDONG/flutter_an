class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  //누르면 false,true전환
  void toggleDone(){
    isDone = !isDone;
  }
}