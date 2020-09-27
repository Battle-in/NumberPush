import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ListAtract extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        testAttract('https://www.flaticon.com/svg/static/icons/svg/3132/3132684.svg', 'Колесо','Veselo', '200-450','12+'),
        testAttract('https://www.flaticon.com/svg/static/icons/svg/3132/3132832.svg', 'Лошадки', 'Для всей семьи', '100-200', '6+'),
        testAttract('https://www.flaticon.com/svg/static/icons/svg/3132/3132682.svg', 'Дартс', 'Испытайте свою меткость!', '150', '12+'),
        testAttract('https://www.flaticon.com/svg/static/icons/svg/3132/3132684.svg', 'wheel','Новые виражи', '200-450','12+'),
        testAttract('https://www.flaticon.com/svg/static/icons/svg/3132/3132832.svg', 'Лошадки', 'Не сажайте цыган', '100-200', '6+'),
        testAttract('https://www.flaticon.com/svg/static/icons/svg/3132/3132682.svg', 'Очко', 'Nice cock!', '150', '12+'),
        // testAttract(),
      ],
    );
  }
}



class testAttract extends StatelessWidget {

  String url;
  String name;
  String descripthion;
  String price;
  String age;


  testAttract(this.url, this.name, this.descripthion ,String inPrice,String aage){
    for(int a = inPrice.length; a < 7; a++){
      inPrice = ' ' + inPrice;
    }
    for(int b = aage.length; b < 3; b++){
      aage = aage + ' ';
    }
    this.age  = aage;
    this.price = inPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: Offset(-1, 6))
                    ],
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 290,
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 40, fontFamily: 'UbuntuBig'),
                    ),
                    Text(
                      descripthion,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'UbuntuReg', fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(56, 10, 0, 0),
                      child: Row(
                        children: [
                          Text(price, style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'UbuntuReg'),),
                          Text('  |  ', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(age, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'UbuntuMed'),),
                          PayButton()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Positioned(
                left: 20,
                child: SvgPicture.network(
                  url,
                  //'https://www.flaticon.com/svg/static/icons/svg/3132/3132684.svg'
                  height: 110,
                  width: 110,
                ),
              ),
            )
          ],
        ));
  }
}

// class Attractions extends StatefulWidget {
//   @override
//   _AttractionsState createState() => _AttractionsState();
// }
//
// class _AttractionsState extends State<Attractions> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 20),
//       decoration: BoxDecoration(
//           //color: Colors.blueAccent,
//           borderRadius: BorderRadius.circular(10)),
//       child: Stack(children: [
//         Padding(
//           padding: EdgeInsets.all(10),
//           child: Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(top: 10, left: 10),
//                 width: 230,
//                 height: 100,
//                 decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.deepPurple.withOpacity(0.5),
//                           spreadRadius: 5,
//                           blurRadius: 8,
//                           offset: Offset(-1, 6))
//                     ]),
//                 child: Center(
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             'Отличный атракцион',
//                             style: TextStyle(),
//                           ),
//                           Row(
//                             children: [Text('150 баксов'), Text('тебе не 18?')],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               PayButton(),
//             ],
//           ),
//         ),
//         Positioned(
//           left: 20,
//           child: SvgPicture.network(
//             'https://www.flaticon.com/svg/static/icons/svg/3132/3132684.svg',
//             height: 70,
//             width: 70,
//           ),
//         ),
//       ]),
//     );
//   }
// }

class PayButton extends StatefulWidget {

  @override
  _PayButtonState createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  var _icon;


  @override
  Widget build(BuildContext context) {
    if (_icon == null) {
      _icon = Icons.payment;
      setState(() {});
    }
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: FlatButton(
        child: Icon(_icon),
        color: Colors.deepOrangeAccent,

        onPressed: () {
          bay();
        },
      ),
    );
  }

  void bay() {
    Navigator.pushNamed(context, '/payPage');
    setState(() {

    });
  }
}
