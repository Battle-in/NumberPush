import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class WaitPage extends StatefulWidget {
  @override
  _WaitPageState createState() => _WaitPageState();
}

class _WaitPageState extends State<WaitPage> {
  String cameraScanResult;
  @override
  Widget build(BuildContext context) {
    if (cameraScanResult == null){
      cameraScanResult = ' ';
    }
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          title: Text(
            'iPark',
            style: TextStyle(fontFamily: 'UbuntuBig'),
          ),
        ),
        body: Column(
          children: [
            Text(cameraScanResult),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                qr_start();
              },
            ),
          ],
        ));
  }

  void qr_start() async {
    cameraScanResult = await scanner.scan();
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);
    print(cameraScanResult);

//print(cameraScanResult);
  }

  void upd() {
    setState(() {});
  }
}
