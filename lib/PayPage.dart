import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

class PayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: CreditCard(cardNumber: "8800 5555 3535 0000",
                cardExpiry: "10/25",
                cardHolderName: "User Ivanovich",
                cvv: "456",
                bankName: "My Bank",
                cardType: CardType.masterCard, // Optional if you want to override Card Type
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(children: [
                TextField(),
                TextField(),
                TextField(),
              ],),
            ),
            FlatButton(
              textColor: Colors.white,
              color: Colors.deepPurple,
              child: Text('Продолжить'),
              onPressed: (){
                Navigator.pushNamed(context, '/waitPage');
              },
            )
          ],
        )
    );
  }
}
