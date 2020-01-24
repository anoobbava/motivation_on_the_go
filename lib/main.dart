import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Text('Hello there'),
    //   ),
    // );
    return Scaffold(
      body: Center(
        child: Text(
          'Hello there',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
