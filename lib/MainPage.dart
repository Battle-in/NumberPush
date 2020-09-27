import 'package:flutter/material.dart';
import 'package:ipark/ListAtract.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text('iPark', style: TextStyle(fontFamily: 'UbuntuBig'),),
        ),
        body: ListAtract()
    );
  }
}