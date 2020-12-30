import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Signup extends StatefulWidget{
  @override
  _SignupState createState()=>_SignupState();
}
class _SignupState extends State<Signup> {
  final _firestore = Firestore.instance;
  String email;
  String password;
  String fullname;
  String Age;
  String phonenumber;
  int _radioValue = 0;
  String result = '';
  bool _obsecureText=false;

  var Country;
var type;
  List<String> _Country = <String>[
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Bahrain',
    'Belarus',
    'Belgium'
    'Brazil',
    'Canada',
    'China',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Ecuador',
    'Egypt',
    'Eritrea',
    'Ethiopia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Honduras',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Italy',
    'Japan',
    'Jordan',
    'Korea, North',
    'Korea, South',
    'Kuwait',
    'Lebanon',
    'Libya',
    'Malaysia',
    'Maldives',
    'Mexico',
    'Morocco',
    'Mozambique',
    'Netherlands',
    'New Zealand',
    'Norway',
    'Oman',
    'Pakistan',
    'Philippines',
    'Poland',
    'Qatar',
    'Russia',
    'Saudi Arabia',
    'Somalia',
    'Spain',
    'Sudan',
    'Sweden',
    'Switzerland',
    'Syria',
    'Tunisia',
    'Turkey',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Venezuela',
    'Yemen',
    'Zambia',
    'Zimbabwe',


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.redAccent,
        title: Text('ORPIT Medical',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
      body: Container(padding:EdgeInsets.only(left:22.0,right: 22.0) ,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new Image.asset('img/img.png',height: 40,),
            TextField(keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "full name",
                  icon: Icon(Icons.assignment_ind, color: Colors.redAccent,)),
              onChanged: (value) {
                setState(() {
                  fullname = value;
                });
              },
            ),
            TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age",
                  icon: Icon(Icons.person, color: Colors.redAccent,)),
              onChanged: (value) {
                setState(() {
                  Age = value;
                });
              },
            ),
            TextFormField(keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email",
                  icon: Icon(Icons.email, color: Colors.redAccent,)),
              validator: (value)=>value.contains('@')?'invalid':null,
              onChanged: (value) {
                setState(() {
                  email = value;

                });
              },
            ),
            TextFormField(keyboardType: TextInputType.text,obscureText: !_obsecureText,
              decoration: InputDecoration(labelText: "password",
                  icon: Icon(Icons.vpn_key, color: Colors.redAccent,)),


              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              validator: (value) =>
              value.length < 6 ? 'Password too short' : null,),
            TextFormField(keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "phone number",
                  icon: Icon(Icons.phone, color: Colors.redAccent,)),
              validator: (value) =>
              value.length < 6 ? 'Password too short' : null,
              onChanged: (value) {
                setState(() {
                  phonenumber = value;
                });
              },
            ),
            Padding(padding: EdgeInsets.only(left: 15,right: 15,top: 10)),
            DropdownButton(
              items: _Country
                  .map((value) => DropdownMenuItem(
                child: Text(
                  value,
                  style: TextStyle(color: Colors.indigoAccent),
                ),
                value: value,
              ))
                  .toList(),
              onChanged: (selectedAccountType) {
                print('$selectedAccountType');
                setState(() {
                  type = selectedAccountType;

                });
              },
              value: type,
              isExpanded: false,
              hint: Text(
                'Choose Country',
                style: TextStyle(color: Colors.indigoAccent),
              ),
            ),

            new Padding(padding: new EdgeInsets.all(5.0)),
            new Container(
              margin: EdgeInsets.only(left: 42.0),
              child: new Row(
                children: <Widget>[
                  new Text(
                      'Gender:   ', style: new TextStyle(color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
                  new Text('Male'),
                  new Radio(value: 0,
                      groupValue: _radioValue,
                      onChanged: handleRadioOnChanged),
                  new Text('Female'),
                  new Radio(value: 1,
                    groupValue: _radioValue,
                    onChanged: handleRadioOnChanged,
                    activeColor: Colors.redAccent,),
                  ],
              ),
            ),


            SizedBox(height:5),
            RaisedButton(padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text("sign up"),
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {
                  FirebaseAuth.instance.
                  createUserWithEmailAndPassword(email: email,
                      password: password).then((signedInUser) {
                    _firestore.collection('userData').add(
                        {
                          'email': email,
                          'password': password,
                          'full name': fullname,
                          'Age': Age,
                          'phone number': phonenumber,
                          'Gander':result,
                          'country':type
                        })
                        .then((value) {
                      if (signedInUser != null) {
                        Navigator.of(context).pushNamed('/Home');
                      }
                    }).catchError((e) {
                      print(e);
                    });
                  },

                  );
                }
            ),

          ],
        ),
      ),
    );
  }

  void handleRadioOnChanged(int value) {
    setState(() {
      _radioValue = value;
    });
    switch (_radioValue) {
      case 0:
        result = 'male';
        break;
      case 1:
        result = 'female';
        break;
    }
  }
}
