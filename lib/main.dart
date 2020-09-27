import 'package:flutter/material.dart';
import 'package:ipark/MainPage.dart';
import 'package:ipark/DataPage.dart';
import 'package:ipark/PayPage.dart';
import 'package:ipark/WaitPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dataPage',
      routes: {
        '/': (BuildContext context) => MainPage(),
        '/dataPage': (BuildContext context) => DataPage(),
        '/payPage': (BuildContext context) => PayPage(),
        '/waitPage': (BuildContext context) => WaitPage(),
      }
    );
  }
}

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurpleAccent,
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: Text('iPark'),
//       ),
//       body: Text('txt')
//     );
//   }
// }




