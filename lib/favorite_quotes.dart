import 'package:flutter/material.dart';

import './Quote.dart';
import './database_helper.dart';

class FavoriteQuotes extends StatefulWidget {
  @override
  _FavoriteQuotesState createState() => _FavoriteQuotesState();
}

class _FavoriteQuotesState extends State<FavoriteQuotes> {
  Future<List<Quote>> wholeQuotes;
  var dbHelper;

  void initState() {
    super.initState();
    dbHelper = DataBaseHelper();
    fetchDatafromTable();
  }

  fetchDatafromTable() {
    setState(() {
      wholeQuotes = dbHelper.fetchSavedQuotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: wholeQuotes,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (builder, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data[index].quoteText,
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: 'quoteScript'),
                        ),
                        subtitle: Text(
                          snapshot.data[index].quoteAuthor,
                          style: TextStyle(
                              fontSize: 17.0, fontFamily: 'quoteScript'),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.red,
                            onPressed: () {
                              dbHelper.deleteQuoteFromFavorite(
                                  snapshot.data[index].quoteId);
                              fetchDatafromTable();
                              final removedSnackBar = SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  'Removed from Favorites',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              );
                              Scaffold.of(context)
                                  .showSnackBar(removedSnackBar);
                            }),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  'No Data in the Favorites',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'quoteScript'),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to Load Favorites'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
