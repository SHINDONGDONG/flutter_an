import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/coinTiker/coin_data.dart';
import 'dart:io' show Platform;



class PriceScreen extends StatefulWidget {


  @override
  _PriceScreenState createState() => _PriceScreenState();
}
const url = "https://rest.coinapi.io";
const apiKey = "5F85D29E-7F92-45A3-91FA-6AA6A98C5227";
String selectedCurrency = 'KRW';
String selectedCrypto = 'BTC';



class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();

  @override
  void initState() {
    super.initState();
    print(coinData.getCoinData(selectedCurrency));
  }

  Widget getPicker() {
    if (Platform.isAndroid) {
      return getDropDownButton();
    } else if (Platform.isIOS) {
      return Text('ios에욤');
    } else {
      return Text('뭐야...');
    }
  }

  DropdownButton<String> getDropDownCoinButton() {
    List<DropdownMenuItem<String>> dropDownItem = [];
    for (String coin in cryptoList) {
      // String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(coin),
        value: coin,);
      dropDownItem.add(newItem);

      return DropdownButton<String>(
        value: selectedCrypto,
        items: dropDownItem,
        onChanged: (value) {
          setState(() {
            selectedCrypto = value;
            print(value);
          });
        },
      );
    }
  }


    DropdownButton<String> getDropDownButton() {
      //드롭다운 메뉴 아이템들을 for문으로 돌려 하나씩 넣어준다
      List<DropdownMenuItem<String>> dropDownItem = [];
      for (String currency in currenciesList) {
        // String currency = currenciesList[i];
        var newItem = DropdownMenuItem(
          child: Text(currency),
          value: currency,);
        dropDownItem.add(newItem);
      }

      //드롭다운버튼을 리턴해주고 for로 돌려준 아이템들을 item으로 지정
      return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItem,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            print(value);
          });
        },
      );
    }


    List<Text> getPickerItems() {
      List<Text> pickerItems = [];
      for (String currency in currenciesList) {
        Text(currency);
        pickerItems.add(Text(currency));
      }
      return pickerItems;
    }

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
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Card(
                  color: Colors.lightBlue,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                    child: Text(
                      '1 BTC = ? KR',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                height: 150,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30),
                color: Colors.lightBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    getDropDownButton(),
                    getDropDownCoinButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}
/*
DropdownButton<String>(
value: selectedCurrent,
items: getDropDownItems(),
onChanged: (value) {
setState(() {
selectedCurrent=value;
});
},
)*/
