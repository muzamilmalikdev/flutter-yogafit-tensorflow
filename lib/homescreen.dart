import 'package:flutter/material.dart';
import 'forgotpassword.dart';

class homescreen extends StatelessWidget {
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
                  Text("HOME", style: TextStyle(color: Colors.white , fontSize: 40),),
                  SizedBox(height: 8,),

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
                          ),
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