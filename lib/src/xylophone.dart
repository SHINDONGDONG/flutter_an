import 'package:audioplayers/audio_cache.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatelessWidget {
  WordPair words = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          buildFlatButton(Colors.red, '1'),
          buildFlatButton(Colors.orange, '2'),
          buildFlatButton(Colors.yellow, '3'),
          buildFlatButton(Colors.green, '4'),
          buildFlatButton(Colors.teal, '5'),
          buildFlatButton(Colors.blueAccent, '6'),
          buildFlatButton(Colors.purple, '7'),
        ]),
      ),
    );
  }

  Widget buildFlatButton(Color color, String noteNum) {
    return Expanded(
      child: FlatButton(
        child: Text(''),
        onPressed: () {
          final player = AudioCache();
          player.play('sounds/note$noteNum.wav');
        },
        color: color,

      ),
    );
  }
}

//
// List.generate(colorList.length, (index) {
// return GestureDetector(
// onTap: (){
// print(colorList[index+1]);
// final player = AudioCache();
// player.play('sounds/note${colorList[index+1]}.wav');
// },
// child: Container(
// margin: EdgeInsets.only(bottom: 15),
// color: colorList[index],
// width: 100,
// height: 50,
// ),
// );
// }),
