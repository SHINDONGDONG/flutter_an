import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('🤣 Coin Ticker'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18,18,18,0),
              child: Card(
                color: Colors.lightBlue,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 28),
                  child: Text(
                    '1 BTC = ? USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30),
              color: Colors.lightBlue,
              child: FlutterLogo(),
            ),
          ],
        )
        ,
      ),
    );
  }
}
