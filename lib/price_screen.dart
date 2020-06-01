import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';

import 'coin_data.dart';
import 'package:bitcoin_ticker/selects.dart';
import 'package:bitcoin_ticker/ratecurancycard.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
//  String selectedCurrency = 'USD';
//  bool isWaiting = false;
//  Map<String, String> coinValues = {};

  Column currencyCard() {
    List<CryptoCard> cryptoCards = [];

    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedCurrency,
          value: isWaiting ? '?' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  // Dropdown android select
//  DropdownButton<String> androidDropdownButton() {
//    List<DropdownMenuItem<String>> dropdownItems = [];
//    for (String currency in currenciesList) {
//      dropdownItems.add(
//        DropdownMenuItem(child: Text(currency), value: currency),
//      );
//    }
//
//    return DropdownButton<String>(
//      items: dropdownItems,
//      onChanged: (value) {
//        setState(() {
//          selectedCurrency = value;
//          getData();
//        });
//      },
//      value: selectedCurrency,
//    );
//  }

  // Cupertino picker select
//  CupertinoPicker iosItemPicker() {
//    List<Text> pickerItems = [];
//    for (String currency in currenciesList) {
//      pickerItems.add(Text(currency));
//    }
//
//    return CupertinoPicker(
//      itemExtent: 32.0,
//      onSelectedItemChanged: (selectedIndex) {
//        setState(() {
//          selectedCurrency = currenciesList[selectedIndex];
//          print('$selectedIndex $selectedCurrency');
//          getData();
//        });
//      },
//      children: pickerItems,
//      backgroundColor: Colors.lightBlue,
//    );
//  }

  /* Create a variable to hold the value and use in our Text Widget.
   * Give the variable a starting value of '?'
   * before the data comes back from the async methods.
   */
  String bitcoinValueInUSD = '?';

  // Async method here await the coin data from coin_data.dart
//  void getData() async {
//    isWaiting = true;
//    try {
//      var data = await CoinData().getCoinData(selectedCurrency);
//      isWaiting = false;
//      // We can't await in a setState(). So you have to separate it out into two steps.
//      setState(() {
//        coinValues = data;
//      });
//    } catch (e) {
//      print(e);
//    }
//  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: currencyCard(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Select(),
//            child: Platform.isIOS ? iosItemPicker() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
