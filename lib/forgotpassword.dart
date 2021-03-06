import 'package:flutter/material.dart';
import 'forgotpassword.dart';
import 'loginscreen.dart';
import 'package:yogafit/welcomescreen.dart';

class forgotpassword extends StatelessWidget {
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
                  Text("FORGOT PASSWORD", style: TextStyle(color: Colors.white , fontSize: 40),),
                  SizedBox(height: 8,),
                  Text("WE GOT YOUR BACK", style: TextStyle(color: Colors.white , fontSize: 18),)
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
                                    decoration: InputDecoration(
                                        hintText: "Password",
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
                                    decoration: InputDecoration(
                                        hintText: "Re-Enter Password",
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
                              Navigator.push(context,MaterialPageRoute (builder: (_) => loginscreen() ));
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
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context,MaterialPageRoute (builder: (_) => loginscreen() ));
                                },
                                child: Text("Reset", style: TextStyle(color: Colors.white),),
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