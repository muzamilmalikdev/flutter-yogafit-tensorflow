import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:yogafit/category_card.dart';
import 'package:yogafit/main.dart';
import 'loginscreen.dart';
import 'welcomescreen.dart';
import 'homescreen.dart';
import 'package:yogafit/homescreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'exercisepage.dart';
import 'package:yogafit/exercisepage.dart';
import 'package:yogafit/provider.dart';
import 'package:intl/intl.dart';
import 'services/auth_service.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String obj;
final AuthService _authService = AuthService();
int age = 18;
signOut() {
  return _firebaseAuth.signOut();
}
class profilepage extends StatefulWidget {
  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
        leading: IconButton(
         padding: EdgeInsets.all(0),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute (builder: (_) => MyHomePage() ));
     },
         alignment: Alignment.topRight,
          iconSize: 30,
          icon: Icon(Icons.arrow_back_ios , color: Colors.black,) ,

    ),
    ),
      extendBodyBehindAppBar: true,
      body: Stack(
          children: <Widget>[
         Column(
      children: <Widget>[

           Container(
             height: MediaQuery.of(context).size.height*0.30,
            width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
              color: Colors.orange[300],
             image: DecorationImage(
            image: AssetImage("assets/undraw_pilates_gpdb.png"),
          )
      ),
             child: Container(
          margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
          ),
        ),
    )

    ],
    ),
        Column(
    children: <Widget>[
          SizedBox(height: 100,),
         Container(
            alignment: Alignment.centerLeft,
           padding: EdgeInsets.all(20),
             child: Text("User Profile ", style: TextStyle(
            fontSize: 40,
         fontWeight: FontWeight.w700
    ),
             ),
    ),
  ],
        ),
           Container(
             height: 450,
             width: 350,
             margin: EdgeInsets.only(left: 30,top: 200.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Textfield(hintText: "Email $obj"),
                 Textfield(hintText: "Gender"),
                 Textfield(hintText: "Age : $age"),
                 Textfield(hintText: "Workout"),
               ],
             ),
           ),
            Container(
              width: 250,
              margin: EdgeInsets.only(left:80 ,top:650),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow[800]
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () async {
                  await _firebaseAuth.signOut().then((result) {
                    Navigator.of(context).pop(true);
                  });
                },
                child: Text("Update Profile", style: TextStyle(color: Colors.white),),

              ),

            ),
            Container(
              width: 250,
              margin: EdgeInsets.only(left:80 ,top:720),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange[800]
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: (){

                },
                child: Text("LogOut", style: TextStyle(color: Colors.white),),

              ),

            )

         ],
        ),


    );
  }
}
Future<FutureBuilder> getUserData() async {
  obj = await _firebaseAuth.currentUser.email;
 // return obj;
}
Widget profileview(){
  return Column(
    children: <Widget>[
      Text("User Profile", style: TextStyle(color: Colors.black , fontSize: 40 , height: 4),),
      SizedBox(height: 0.1,),
      Text("Page", style: TextStyle(color: Colors.black , fontSize: 18),),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 90),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            gradient: LinearGradient(
               begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [Colors.orange , Colors.orange[300]]
            )
          ),
        ),
      )
    ],
  );
}
Widget Textfield({@required String hintText}){
  return Material(
    elevation: 4,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: TextField(
       decoration: InputDecoration(
         hintText: hintText ,
         hintStyle: TextStyle(
           letterSpacing: 2,
           color: Colors.black,
           fontWeight: FontWeight.bold,
         ),
         fillColor: Colors.white30,
         filled: true,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10.0),
           borderSide: BorderSide.none,
         )
       ),
    ),
  );
}