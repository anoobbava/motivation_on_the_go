import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './Quote.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

// call the API and fetch the response
Future<Quote> fetchQuote() async {
  final response = await http.get('https://favqs.com/api/qotd');

  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Quote');
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Quote> quote;

  @override
  void initState() {
    super.initState();
    quote = fetchQuote();
  }

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
        FutureBuilder<Quote>(
          future: quote,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Text(
                        snapshot.data.quoteText,
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontFamily: 'quoteScript'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      snapshot.data.quoteAuthor,
                      style: TextStyle(
                          fontSize: 23.0,
                          color: Colors.white,
                          fontFamily: 'quoteScript'),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ]),
    );
  }
}
