import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quote_app/provider/quote_provider.dart';
import 'package:quote_app/views/homepage.dart';
import 'package:quote_app/views/splacescreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => quoteprovider())],
      builder: (context, _) {
        return MaterialApp(
          routes: {
            '/': (context) => splacescreen(),
            'home_page': (context) => Homepage(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
        );
      },
    ),
  );
}
