//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patients2/ui/singin.dart';
import 'package:patients2/ui/userviwer.dart';
import 'package:patients2/ui/contactus.dart';
import 'package:patients2/ui/aboutus.dart';
import 'package:patients2/ui/medicalservices.dart';
class Home extends StatefulWidget{
  @override
  _HomeState createState()=>  _HomeState();
}
class   _HomeState extends State<Home>with SingleTickerProviderStateMixin{
  TabController tabController;


  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void>Logout()async{
    FirebaseUser user=auth.signOut() as FirebaseUser;
  }

  int _currentIndex=0;
  String email;
  String password;
  @override
  void initState(){super.initState();
  tabController=new TabController(length: 4, vsync: this);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.redAccent,title: Text('PHORT Medical'), actions:<Widget>[

      // new IconButton(icon:new Icon(Icons.close,size: 30,),onPressed: (){
      // Logout();
      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Signin()));
      new IconButton(icon: Icon(Icons.account_circle), onPressed: (){Navigator.of(context).pushNamed('/ProfilePage');

        //  }
        //   );
      },

      ),
    ],
    ),
//body:new Container(
        // child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        // children:<Widget> [
        //  FlatButton(
        //  child: Text("log out"),
        //  onPressed: (){
        //  Logout();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Signin()));
        // },
        //),

        //  ],
        //  ),
//),
        bottomNavigationBar: new Material(
          //BottomNavigationBar(backgroundColor: Colors.redAccent,
          //currentIndex:_currentIndex ,
          //items: [
          color:Colors.redAccent,
          child:TabBar(
            controller: tabController,
            tabs:<Widget>[
              new Tab(icon:Icon(Icons.home,),child:Text ('Home',style: TextStyle(fontSize:10),)),
              new Tab(icon:Icon(Icons.album),child:Text ('about us',style: TextStyle(fontSize:10),)),
              new Tab(icon:Icon(Icons.contacts),child:Text ('Contact us',style: TextStyle(fontSize:10),)),
              new Tab(icon:Icon(Icons.local_hospital),child:Text ('Medical services',style: TextStyle(fontSize:10),)),
            ],
          ),
        ),
        body:new TabBarView(controller: tabController,
          children:<Widget> [
            Dashbord(),
            Five(),
            Six(),
            MedicalServices(),

          ],)

      //BottomNavigationBarItem(
      //  icon: Icon(Icons.home),
      //  title: Text('Home',),
      //backgroundColor: Colors.blue),

      //BottomNavigationBarItem(
      // icon: Icon(Icons.album),
      // title: Text(' about us',style: new TextStyle(fontSize: 12),),
      // backgroundColor: Colors.blue,),

      // BottomNavigationBarItem(
      // icon: Icon(Icons.contacts),
      //  title: Text(' Contact us'),
      //  backgroundColor: Colors.white),

      //BottomNavigationBarItem(
      // icon: Icon(Icons.local_hospital),
      // title: Text('MedicalService'),
      //  backgroundColor: Colors.white),],


      // onTap:  (index) {
      // setState(() {
      // if (index == 1) {
      //  Navigator.of(context).pushNamedAndRemoveUntil('/Five',(Route<dynamic> route)=>false);}
      // else if(index==2){
      //  Navigator.of(context).pushNamedAndRemoveUntil('/Six',(Route<dynamic> route)=>false);}
      // }
      //  );
      //},
      // fixedColor: Colors.white,

      // type:BottomNavigationBarType.fixed

      //  ),



    );
  }

}
class Dashbord extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  child: Text('Home Page'),

      body:new Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [





          ],
        ),
      ),
    );
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void>Logout()async{
    FirebaseUser user=auth.signOut() as FirebaseUser;
  }
}

