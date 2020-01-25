class Quote {
  final String quoteText;
  final String quoteDate;
  final String quoteAuthor;
  Quote({this.quoteText, this.quoteDate, this.quoteAuthor});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteText: json['quote']['body'],
      quoteDate: json['qotd_date'],
      quoteAuthor: json['quote']['author'],
    );
  }
}
