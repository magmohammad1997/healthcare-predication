import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class  Five extends StatefulWidget{
  @override
  _FiveState createState() => _FiveState();


}

class _FiveState   extends State<Five>{
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(

      //title: new Text('about us'),backgroundColor: Colors.redAccent),
      //body: new Container(
      //alignment: Alignment.center,


      body:new Container(
          padding: EdgeInsets.all(1.0),

          child: new Column(

              children:<Widget >[
                new Text('this program....................................')


              ]






          )
      ),
    );





  }
}