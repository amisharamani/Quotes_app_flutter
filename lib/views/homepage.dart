import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/quote_Model.dart';
import '../provider/quote_provider.dart';
import '../utils/helpers.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homepage> {
  QuoteModel? quote;

  @override
  void initState() {
    super.initState();
    fetchRandomQuote();
    savedQuote();
    Provider.of<quoteprovider>(context, listen: false).date();
  }

  Future<void> savedQuote() async {
    final prefs = await SharedPreferences.getInstance();
    final quoteList = prefs.getStringList("saved_quote");
    if (quoteList != null) {
      final quoteMap = {
        'id': quoteList[0],
        'content': quoteList[1],
        'author': quoteList[2],
        'authorSlug': quoteList[3],
      };
      quote = QuoteModel.fromMap(quoteMap);
    }
    setState(() {});
  }

  Future<void> fetchRandomQuote() async {
    quote = await APIHelper.apiHelper.fetch();
    if (quote != null) {
      await saveQuoteToSharedPreferences(quote!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _height = size.height;
    double _width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Quotes"),
        actions: [
          ElevatedButton(
            onPressed: fetchRandomQuote,
            child: Text("Fetch Quote"),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/premium-vector/vector-template-blank-rectangle-quote-speech-box-with-bracket-empty-frame-messages-business_662353-857.jpg?w=2000"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        Provider.of<quoteprovider>(context, listen: true)
                            .datemodel
                            .dateTime!,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      quote?.content ??
                          "Life is what happens when you're busy making other plans.",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        quote?.author ?? "John Lennon",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
