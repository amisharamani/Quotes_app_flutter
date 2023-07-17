import 'dart:async';

import 'package:flutter/material.dart';

class splacescreen extends StatefulWidget {
  const splacescreen({super.key});

  @override
  State<splacescreen> createState() => _splacescreenState();
}

class _splacescreenState extends State<splacescreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.of(context).pushReplacementNamed("home_page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/28/40/5e/28405eaf8b7b18bf62112f5acc4c1c60.gif"),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Quote APP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blueAccent),
              ),
            ),
          ],
        )
      ]),
      backgroundColor: Colors.white,
    );
  }
}
