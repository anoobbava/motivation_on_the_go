import 'package:flutter/material.dart';

import './quote_data.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(
          child: Image.asset(
            'images/background.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
        ),
        QuoteData(),
      ]),
    );
  }
}
