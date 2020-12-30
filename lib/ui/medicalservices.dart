import 'package:flutter/material.dart';

class MedicalServices extends StatefulWidget{
  @override
  _MedicalServicesState createState()=>_MedicalServicesState();

}

class _MedicalServicesState extends State<MedicalServices>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.white,actions:<Widget> [
        FlatButton(child:Text(' during day')

        ),
        FlatButton(child: Text('during week'),),
        FlatButton(child: Text(' during Month'),)]
      ),
    );
  }
}