import 'package:shared_preferences/shared_preferences.dart';

class QuoteModel {
  String id;
  String content;
  String author;

  QuoteModel({
    required this.id,
    required this.content,
    required this.author,
  });

  factory QuoteModel.fromMap(Map<String, dynamic> data) {
    return QuoteModel(
      id: data['_id'],
      content: data['content'],
      author: data['author'],
    );
  }
}

Future<void> saveQuoteToSharedPreferences(QuoteModel quote) async {
  final prefs = await SharedPreferences.getInstance();
  final quoteMap = {
    'id': quote.id,
    'content': quote.content,
    'author': quote.author,
  };
  await prefs.setStringList('saved_quote', quoteMap.values.toList());
}

class dateModel {
  DateTime datetime;
  String? dateTime;

  dateModel({
    required this.datetime,
  });
}
