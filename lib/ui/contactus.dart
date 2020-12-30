import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class   Six extends StatefulWidget{
  @override
  _SixState createState() => _SixState();


}



class _SixState   extends State<Six>{
  int _currentIndex=0;



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      // appBar: new AppBar(title: new Text('contant us',
      // style: new TextStyle(color: Colors.black87,fontStyle: FontStyle.italic,),),

      // backgroundColor: Colors.redAccent,
      //actions:<Widget> [
      // new IconButton(icon:new Icon(Icons.account_circle,size: 30,color: Colors.white,),onPressed:null)],),
      body: new Container(
        alignment: Alignment.center,

        child:new Container(child:Column(children: <Widget>[Text('Contact us:                                                                          ',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          SizedBox(height: 10,),
          FlatButton(child:Text(
            'Email:                                                                              phort.medical@yahoo.com                                              ',
            style: TextStyle(fontSize: 15,color: Colors.black),),onPressed: ()async{
            const url='https://mail.phort.medical@yahoo.com/d/folders/1';
            if(await canLaunch(url)){await launch(url);}else{throw'could not lanch${url}';}},),SizedBox(height: 15,),
          FlatButton(child: Text(' https://www.facebook.com/profile.php?id=100056621630318',style: TextStyle(fontSize: 15,color: Colors.black),),
            onPressed: ()
            async{
              const url='https://mail.PhortMedicalProject@facebook.com/d/folders/1';
              if(await canLaunch(url)){await launch(url);}else{throw'could not lanch${url}';}},),SizedBox(height: 15,), ],
        ),
         // padding: EdgeInsets.all(12.0),


        ),
      ),



    );
  }
  openUrl(){
    String url='Facebook: https://www.facebook.com/profile.php?id=100056621630318';
    launch(url);
  }
}