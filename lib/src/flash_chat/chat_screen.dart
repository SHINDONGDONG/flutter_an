import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//fireStore의 인스턴스
final _firestore = FirebaseFirestore.instance;
User loginUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();

  final _auth = FirebaseAuth.instance;


  //메세지를 저장하는 변수
  String messageText;

  @override
  void initState() {
    super.initState();
    //현재 유저를 불러오는 메소드를 initstate에 트리거해준다.
    //왜냐하면 항상 불러와야하니깐
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      //현재 유저가 로그인 되어 있을경우.
      if (user != null) {
        loginUser = user;
        print(loginUser.email);
      }
    } catch (e) {
      print('ChatScreen.dart의 getCurrentUser메소드 $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('⚡ Chat'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Get.back();
              }),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MessageStream(),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  messageText = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Enter your address...',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        //메세지를 보냈을 때 messageText + loginuser.email
                        //firebase messages 테이블에 도큐먼트는 랜덤, 셋 아래의 파라메터를 넣어줌
                        _firestore.collection('messages').doc().set(
                            {'text': messageText, 'sender': loginUser.email});
                        textEditingController.clear();

                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.lightBlueAccent,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //해당 스트림빌더가 querysnapshot을 받고있다는 제네릭을선언
      StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        //스트림빌더의   스냅샷은 비동기 스냅샷 firestore 쿼리를 포함하고있음
        builder: (context, snapshot) {
          //스트림 스냅샷에 데이터가 있으면
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          {
            //이 스냅샷이 실제 쿼리 스냅샷으로 업데이트됨
            final messages = snapshot.data.docs.reversed; //비동기 스냅샷 내부의 데이터에 엑서스
            List<MessageBubble> messageBubbles = [];
            for (var message in messages) {
              final messageJson = message.data();
              final currentUser = loginUser.email;
              if(currentUser == messageJson['sender']){
              }

              final messageBubble = MessageBubble(
                text: messageJson['text'],
                sender: messageJson['sender'],
                isMe: currentUser == messageJson['sender'],
              );
              messageBubbles.add(messageBubble);
            }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 10,
                  right: 10,
                ),
                child: ListView(
                  reverse: true,
                  children: messageBubbles //메세지를 넣은 list를 돌리는곳에 리스트뷰,익스펜드
                  ,
                ),
              ),
            );
          }
        },
      );
  }
}



class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text,this.isMe});
  final bool isMe;
  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          Material(
            //머테리얼 위젯은 배경을 지정할 수 있다.
            elevation: 5.0,

            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(30) : Radius.zero,
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: isMe ? Radius.zero : Radius.circular(30),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '$text',
                style: isMe ? TextStyle(fontSize: 15):TextStyle(fontSize: 15,color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
