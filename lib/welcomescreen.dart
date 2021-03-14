import 'package:flutter/material.dart';
import 'forgotpassword.dart';
import 'loginscreen.dart';
import 'package:yogafit/welcomescreen.dart';

class welcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.white,
                Colors.orange[400],
                Colors.orange[500]
              ])
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 300,),
              Padding(
                padding: EdgeInsets.all(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("YOGA FIT - DAILY", style: TextStyle(color: Colors.white , fontSize: 40),),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal:70),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange[900]
                      ),
                      child: Center(
                        child: FlatButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute (builder: (_) => loginscreen() ));
                          },
                          child: Text("SIGN IN", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}