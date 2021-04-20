import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/destini/stroy_brain.dart';

class Destini extends StatefulWidget {

  @override
  _DestiniState createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 15),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                    storyBrain.nextStory(1);
                    });
                  },
                  child: Text(storyBrain.getChoice1(),
                  style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 2,
                child: Visibility( //visible 펄스면 나옴 true면 위젯이 사라짐
                  visible: storyBrain.getChoice2()=='' ? false : true,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                      storyBrain.nextStory(2);
                      });
                    },
                    child: Text(storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
