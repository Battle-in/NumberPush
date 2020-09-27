import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  List<String> _age;

  @override
  Widget build(BuildContext context) {
    var _gender = 'M';
    var a = 0;
    _age = getMass();

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('iPark', style: TextStyle(fontFamily: 'UbuntuBig'),),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Center(child:
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.orangeAccent),
                child: Column(children:
                [ Text(
                  'Пожалуйста,\n заполните форму.', style: TextStyle(fontFamily: 'UbuntuBig', fontSize: 30),
                ),
                  Text('-------------------------------------------------------------------------'),
                  DropdownButton<String>(
                    hint: Text('Выберите ваш пол'),
                    items: <String>['M', 'Ж'].map((String value) {
                      return new DropdownMenuItem<String>(
                        child: new Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  DropdownButton<String>(
                    hint: Text('укажите ваш возраст'),
                    items: _age.map((String value) {
                      return new DropdownMenuItem<String>(
                        child: new Text(value),
                        value: value,
                        onTap: (){a++;},
                      );
                    }).toList(),
                    onChanged: (_) {a++;},
                  ),
                  FlatButton(
                    textColor: Colors.white,
                    color: Colors.deepPurple,
                    child: Text('Продолжить'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ]
                ),
              )
          )
      ),
    );
  }

  List<String> getMass(){
    List<String> list = ['6'];
    for(int a = 7; a < 100; a++){
      list.add(a.toString());
    }
    return list;
  }
}
