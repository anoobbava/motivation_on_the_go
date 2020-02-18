import 'package:flutter/material.dart';

import './quote_data.dart';
import './favorite_quotes.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: HomePage(),
        ),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: size.width / 5,
        backgroundColor: Colors.black,
        title: Text(
          'Daily motivation',
          style: TextStyle(fontFamily: 'quoteScript', fontSize: 22.0),
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Tooltip(
              message: 'Daily Quotes',
              child: Tab(
                icon: Icon(
                  Icons.today,
                ),
              ),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Stack(children: <Widget>[
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
          FavoriteQuotes(),
        ],
      ),
    );
  }
}
