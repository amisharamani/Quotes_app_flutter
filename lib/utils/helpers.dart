import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/quote_Model.dart';

class APIHelper {
  APIHelper._(); //private named constructor
  static final APIHelper apiHelper = APIHelper._();

  Future<QuoteModel?> fetch() async {
    String url = "http://api.quotable.io/random";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      QuoteModel quoteData = QuoteModel.fromMap(decodedData);
      return quoteData;
    }
    return null;
  }
}
