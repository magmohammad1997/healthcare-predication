
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patients2/ui/aboutus.dart';
import 'package:patients2/ui/contactus.dart';
import 'package:patients2/ui/provider.dart';
import 'package:patients2/ui/service.dart';
import 'package:patients2/ui/singin.dart';
import 'package:patients2/ui/signup.dart';
import 'package:patients2/ui/home.dart';
import 'package:patients2/ui/userviwer.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      db:Firestore.instance,
      child: new MaterialApp( debugShowCheckedModeBanner: false,
        home: Signin(),
        routes: {

          '/signin':(BuildContext context)=>new Signin(),
          '/Signup':(BuildContext context)=>new Signup(),
          '/Home':(BuildContext context)=>new Home(),
          '/Five':(BuildContext context)=>new Five(),
          '/Six':(BuildContext context)=>new Six(),
          '/ProfilePage':(BuildContext context)=>new ProfilePage (),
         // '/Homepage':(BuildContext context)=>new HomePage (),
        },
      ),
    );
  }
}
