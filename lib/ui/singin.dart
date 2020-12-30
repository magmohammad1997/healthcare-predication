import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Signin extends StatefulWidget{
  @override
  _SigninState createState()=> _SigninState();
}


class  _SigninState extends State< Signin> {
  String email;
  String password;
  bool _obscureText = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.only(left: 1, right: 1),
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ new Image.asset('img/iim.jpg', height: 200,),
          SizedBox(height: 10,),
          new Container(alignment: AlignmentDirectional.center,

            child: Text('ORPIT Medical', style: TextStyle(color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            ),
          ),


          SizedBox(height: 50),
          new Container(padding: EdgeInsets.only(left: 10, right: 10),
            alignment: AlignmentDirectional.center,

            child: TextFormField(obscureText: _obscureText,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  // icon: Icon(Icons.email, color: Colors.red,),
                  hintText: 'Enter your email address'),
              validator: (value) => !value.contains('@') ? 'invalid' : null,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },

            ),),

          SizedBox(height: 10,),
          new Container(padding: EdgeInsets.only(right: 10, left: 10),
            child: TextField(obscureText: !_obscureText,
              decoration: InputDecoration(labelText: "password",
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),

              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),),
          SizedBox(height: 10,),
          new Container(padding: EdgeInsets.only(right: 10, left: 10),

            child: RaisedButton(padding: EdgeInsets.symmetric(horizontal: 130),
              child: Text("sign in", style: TextStyle(color: Colors.white),),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              // borderSide: BorderSide(color: Colors.pinkAccent,),
              onPressed: () {
                FirebaseAuth.instance.
                signInWithEmailAndPassword(email: email, password: password)
                    .then((FirebaseUser user) {
                  Navigator.of(context).pushReplacementNamed('/Home');
                }).catchError((e) {
                print('e');
                });
              },

            ),),


          SizedBox(height: 10,),
          new Container(child: new Row(children: <Widget>[
            Text("               Don't have an account?",

              style: TextStyle(color: Colors.red),),
            FlatButton(child: Text(
              "sign up here", style: TextStyle(color: Colors.indigo),),
              onPressed: () {
                Navigator.of(context).pushNamed('/Signup');
              },
            ),


          ],
          ),
          ),
        ],
      ),
    );
  }
}


