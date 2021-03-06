import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:device_id/device_id.dart';

////////////////////////////////////////////////
//  \\ ОСТОРОЖНО   ИЗОБИЛИЕ   ОВНОКОДА   \\   //
////////////////////////////////////////////////
//   \\\\     ОПАСНАЯ    ЗОНА!!!      \\\\\   //
////////////////////////////////////////////////

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (BuildContext buildContext) => LoadingPage(),
      '/main': (BuildContext buildContext) => MainPage(),
      // '/regist': (BuildContext context) => RegisterPage(),
      '/shop': (BuildContext context) => ShopPage()
    },
  ));
}

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.black,
        elevation: 50,
      ),
      body: Center(
        child: Text('put you card'),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  String deviceid = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tests'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(deviceid),
              FlatButton(
                color: Colors.black,
                onPressed: () {
                  upd();
                },
              ),
              FlatButton(
                color: Colors.grey,
                onPressed: () {
                  pushAllData();
                },
              ),
              FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
              )
            ],
          ),
        ));
  }

  void pushAllData() {
    var jsson = deviceid;
    print(jsson + '\n' + '\n');
    http.post('https://bsl-show.ru/api/useragent.php', body: {
      'device_id': jsson,
      'age': '51',
      'gender': 'email'
    }).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${json.decode(response.body)}");
      deviceid = json.decode(response.body);
    });
  }

  void pushData() {
    var jsson = deviceid;
    print(jsson + '\n' + '\n');
    http.post('https://bsl-show.ru/api/useragent.php',
        body: {'device_id': jsson}).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${json.decode(response.body)}");
      deviceid = json.decode(response.body);
    });
  }

  void getData() {
    http.get('https://bsl-show.ru/api/autrhz.php').then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${json.decode(response.body)}");
      deviceid = json.decode(response.body);
    });
  }

  void upd() async {
    deviceid = await DeviceId.getID;
    print(deviceid);
  }
}

/////////////////
// КАРАНТИН!!!!//
/////////////////
// class SignPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext buildContext) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.only(top: 0, bottom: 50, left: 40, right: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                   decoration:
//                       InputDecoration(labelText: 'Enter your username')),
//               TextFormField(
//                   decoration: InputDecoration(
//                 labelText: 'password',
//               )),
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(15),
//                     child: OutlineButton(
//                       color: Colors.red,
//                       onPressed: () {
//                         Navigator.pushNamed(buildContext, '/main');
//                       },
//                       child: Text(
//                         'Войти',
//                       ),
//                     ),
//                   ),
//                   Container(
//                       padding: EdgeInsets.all(15),
//                       child: OutlineButton(
//                         color: Colors.red,
//                         child: Text('Регистрация'),
//                         onPressed: () {
//                           Navigator.pushNamed(buildContext, '/regist');
//                         },
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MainPage extends StatelessWidget {
  final sub_color = Colors.orangeAccent;
  final main_color = Colors.blueAccent;

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
        backgroundColor: main_color,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: sub_color,
          shadowColor: Colors.black,
          elevation: 50,
          title: Icon(
            Icons.radio_button_unchecked,
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("you shipping");
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            ),
          ],
        ),
        drawer: Drawer(
            child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: ListView(
            children: [
              CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
              ),
              FlatButton(
                child: Text('первый вариант'),
              ),
              FlatButton(
                child: Text('второй'),
              ),
              FlatButton(
                child: Text('интересно какой по счету'),
              )
            ],
          ),
        )),
        body: AttractionList());
  }
}

class AttractionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Attraction(
            'https://static-pano.maps.yandex.ru/v1/?panoid=1254218279_625935174_23_1564207835&size=500,240&azimuth=-135.4&tilt=10&signature=7plqoxrxYl0SJs84vU-FohG4Ea62yRD5629PMh8dDz0=',
            'Внатуре колесо',
            '450р',
            'от 16',
            '3',
            '16a'),
        Attraction(
            'https://sun9-51.userapi.com/9nwBIlWYr3-XnvJJi5L6Ch5HhCoy6-yoYIVpwQ/OA8nS3obAck.jpg',
            'Кармагедон',
            ' 10р',
            'от 0 ',
            '20',
            '16a'),
        Attraction(
            'https://static-pano.maps.yandex.ru/v1/?panoid=1254218279_625935174_23_1564207835&size=500,240&azimuth=-135.4&tilt=10&signature=7plqoxrxYl0SJs84vU-FohG4Ea62yRD5629PMh8dDz0=',
            'Внатуре колесо',
            '450р',
            'от 16',
            '3',
            '16a'),
        Attraction(
            'https://static-pano.maps.yandex.ru/v1/?panoid=1254218279_625935174_23_1564207835&size=500,240&azimuth=-135.4&tilt=10&signature=7plqoxrxYl0SJs84vU-FohG4Ea62yRD5629PMh8dDz0=',
            'Внатуре колесо',
            '450р',
            'от 16',
            '3',
            '16a'),
      ],
    );
  }
}

class Attraction extends StatelessWidget {
  String _url;
  String _price;
  String _age;
  String _id;
  String _text;
  String _rating;

  Attraction(String url, String text, String price, String age, String rating,
      String id) {
    _url = url;
    _text = text;
    _price = price;
    _age = age;
    _id = id;
    _rating = rating;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              Image.network(
                _url,
                //scale:
                //fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                    child: Column(children: [
                      Text(_text,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                _price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Text('   '),
                              Container(
                                // color: Colors.black,
                                child: Text(
                                  _age,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              Text('    '),
                              Text(
                                _rating,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.yellowAccent),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                              )
                            ],
                          ))
                    ]),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                      icon: Icon(Icons.payment),
                      onPressed: () {
                        Navigator.pushNamed(context, '/shop');
                      },
                    ),
                  )
                ],
              ),
            ])));
  }
}

// class RegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Register')), body: Text('register page'));
//   }
// }
