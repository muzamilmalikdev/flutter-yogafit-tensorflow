import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yogafit/homescreen.dart';
import 'package:yogafit/main.dart';
import 'forgotpassword.dart';
import 'registeruser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yogafit/services/auth_service.dart';
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override

  Future<void> _showMyDialog(@required String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$message'),
                Text('Login Again'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Login Again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

 final _auth = FirebaseAuth.instance;
  String email;
  String password;




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
       width:double.infinity,
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
                  Text("LOGIN", style: TextStyle(color: Colors.white , fontSize: 40),),
                  SizedBox(height: 8,),
                  Text("WELCOME BACK", style: TextStyle(color: Colors.white , fontSize: 18),)
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
                                  child: TextFormField(
                                    onChanged: (value){
                                      email = value;
                                    },
                                    validator: (value){
                                      if(value.isEmpty)
                                        {
                                          // _showMyDialog();
                                        }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,

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
                                  child: TextFormField(

                                    onChanged: (value){
                                      password = value;
                                      if(value.isEmpty)
                                      {
                                        //_showMyDialog();
                                      }
                                    },
                                    validator: (String value){
                                      if(value.isEmpty)
                                      {
                                        //_showMyDialog();
                                      }
                                      return null;
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
                          GestureDetector( child : Text("Forget Password?", style: TextStyle(color: Colors.grey),),
                            onTap: () {
                              _firebaseAuth.sendPasswordResetEmail(email: email);
                            },
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
                                onPressed: ()
                                  async{
                                    try {
                                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
                                          password: password,
                                      );
                                      if (userCredential != null) {
                                        Navigator.pushAndRemoveUntil( context, MaterialPageRoute(builder: (context) => MyHomePage()), (Route<dynamic> route) => false, );
                                      }

                                    } on FirebaseAuthException catch(e)
                                    {
                                    if (e.code == 'user-not-found') {
                                       _showMyDialog("User Not Found");
                                      }
                                    else if (e.code == 'wrong-password') {
                                     _showMyDialog("Wrong Password");
                                    }
                                    }
                                  },
                                child: Text("Login", style: TextStyle(color: Colors.white),),
                              ),
                            ),

                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 250,
                            margin: EdgeInsets.symmetric(horizontal:50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.yellow[800]
                            ),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: (){

                                Navigator.push(context,MaterialPageRoute (builder: (_) => registeruser() ));
                              },
                              child: Text("Register", style: TextStyle(color: Colors.white),),

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