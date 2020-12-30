import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patients2/ui/singin.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _redColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.redAccent,
        height: 250,
        width: MediaQuery
            .of(context)
            .size
            .width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      top: 100,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("User information:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    width: 20,)



                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userAdress() {
    return Positioned(
      top: 380,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            ],
          ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,

        actions: <Widget>[FlatButton( child: Text('sign out',style: TextStyle(color: Colors.white),),
         // child: Text("log out"),
          onPressed: () {
            Logout();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => Signin()));
          },
        ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            _redColors(),
            _getInfo(),
            _userAdress(),
          ],
        ),
      ),
    );
  }


  }

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> Logout() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }



