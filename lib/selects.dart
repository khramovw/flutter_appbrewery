import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';

import 'coin_data.dart';

class Select extends StatefulWidget {
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
//  Dropdown select
  DropdownButton<String> androidDropdownButton() {
//    List<DropdownMenuItem<String>> dropdownItems = [];
//    for (String currency in currenciesList) {
//      dropdownItems.add(
//        DropdownMenuItem(child: Text(currency), value: currency),
//      );
//    }

    return DropdownButton<String>(
      items: currenciesList
          .map((c) => DropdownMenuItem(child: Text(c), value: c))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
      value: selectedCurrency,
    );
  }

// Cupertino picker select
  CupertinoPicker iosItemPicker() {
//    List<Text> pickerItems = [];
//    for (String currency in currenciesList) {
//      pickerItems.add(Text(currency));
//    }
//    List<Text> pickerItems = currenciesList.map((c) => Text(c)).toList();

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          print('$selectedIndex $selectedCurrency');
        });
        getData();
      },
      children: currenciesList.map((c) => Text(c)).toList(),
      backgroundColor: Colors.lightBlue,
    );
  }

//  NotificationListener iosItemPicker() {
//     return NotificationListener<ScrollEndNotification>(
//      onNotification: (ScrollEndNotification notification) {
//        calculateConversionRates(selectedCurrency);
//        return true;
//      },
//       child: CupertinoPicker(
//        onSelectedItemChanged: (value) {
//          setState(() {
//            conversionRates = null;
//            selectedCurrency = coinData.currenciesList[value];
//          });
//        },
//        scrollController: FixedExtentScrollController(
//            initialItem: coinData.currenciesList.indexOf(selectedCurrency)),
//        backgroundColor: Colors.lightBlue,
//        itemExtent: 32,
//        children:
//            coinData.currenciesList.map((currency) => Text(currency)).toList(),
//      ),
//    );
//  }

  // Async method here await the coin data from coin_data.dart
  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      // We can't await in a setState(). So you have to separate it out into two steps.
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.lightBlue,
      child: Platform.isIOS ? iosItemPicker() : androidDropdownButton(),
    );
  }
}
