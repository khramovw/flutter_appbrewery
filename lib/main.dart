import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: false,
        title: Text(
          'Ask Me Anything',
        ),
//        bottom: PreferredSize(
//          child: Text(
//            'Ask me anything',
//          ),
//          preferredSize: null,
//        ),
      ),
      body: Container(
        child: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballImg = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            setState(() {
              ballImg = Random().nextInt(5) + 1;
            });
          },
          child: Image.asset('images/ball$ballImg.png'),
        ),
      ),
    );
  }
}
