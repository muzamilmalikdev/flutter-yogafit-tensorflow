import 'package:flutter/material.dart';
import 'package:yogafit/homescreen.dart';
import 'package:yogafit/loginscreen.dart';
import 'package:yogafit/main.dart';
import 'forgotpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginscreen.dart';
import 'package:firebase_database/firebase_database.dart';

var uuid;

class registeruser extends StatefulWidget{
  static const id = 'registeruser';
  @override
  _registeruser createState() => _registeruser();
}

class _registeruser extends State <registeruser> {
  final _auth = FirebaseAuth.instance;
  String email;
  String name;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(

       // width:double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.orange[500],
              Colors.orange[300],
              Colors.orange[400]
            ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("REGISTER", style: TextStyle(color: Colors.white , fontSize: 40),),
                  SizedBox(height: 8,),
                  Text("LETS DO YOGA!", style: TextStyle(color: Colors.white , fontSize: 18),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          Container(
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0,10),
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    onChanged: (value){
                                      name = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Name",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    onChanged: (value){
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Email or phone number",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    onChanged: (value){
                                      password = value;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),


                          SizedBox(height: 40,),
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal:50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]
                            ),

                            child: Center(
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () async{
                                  try {
                                    final User newUser  = (await _auth
                                        .createUserWithEmailAndPassword(
                                        email: email, password: password).catchError((ex){
                                          FirebaseAuthException thisex = ex;
                                    })).user;
                                  setState(() {
                                    uuid = newUser.uid;
                                  });
                                    Navigator.pop(context);

                                    Map userMap = {
                                      'fullname': name,
                                      'email': email,
                                      //'Phone': phoneController.text,
                                    };

                                    DatabaseReference dRef = FirebaseDatabase.instance.reference().child('Users/${newUser.uid}');

                                    dRef.set(userMap);
                                    //newUserRef.set(userMap);
                                    if(newUser != null)
                                      {
                                        Navigator.push(context,MaterialPageRoute (builder: (_) => loginscreen() ));
                                      }
                                  }
                                  catch(e){
                                    print(e);
                                  }

                                },
                                child: Text("Register", style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          )
                        ],
                      )
                  )

              ),
            )
          ],
        ),
      ),
    );
  }
}