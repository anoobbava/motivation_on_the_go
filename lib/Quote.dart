class Quote {
  final String quoteText;
  final String quoteDate;
  final String quoteBackgound;
  Quote({this.quoteText, this.quoteDate, this.quoteBackgound});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteText: json['contents']['quotes'][0]['quote'],
      quoteDate: json['contents']['quotes'][0]['date'],
      quoteBackgound: json['contents']['quotes'][0]['background'],
    );
  }
}
