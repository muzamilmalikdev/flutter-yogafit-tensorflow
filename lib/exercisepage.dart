import 'package:flutter/material.dart';
import 'package:yogafit/loginscreen.dart';
import 'package:yogafit/virtualtrainer.dart';
import 'package:yogafit/welcomescreen.dart';
import 'forgotpassword.dart';
import 'main.dart';
import 'package:camera/camera.dart';
import 'package:yogafit/services/camera.dart';

class exercisepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    
      backgroundColor: Color(0xfff8f8f8),
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
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
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
              SizedBox(height: 90,),
              Container(
                height: 130,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text(" PLANK \n ARM POSE", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                ),),
              ),
              Container(
                height:200,
                  decoration: BoxDecoration(
                   image: DecorationImage(
                    // alignment: Alignment.centerRight,
                   image: AssetImage("assets/plankgif.gif"),
                     alignment: Alignment.center,
                   )
               ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment(20,20),
                    // ignore: deprecated_member_use
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal:50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange[900]
                      ),
                      child: Center(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute (builder: (_) => virtualtrainer() ));
                          },
                          child: Text("LAUNCH VIRTUAL TRAINER", style: TextStyle(color: Colors.white),),
                        ),
                      ),

                    ),
                  )
                ],
              )
            ],
          )

        ],
      ),

    );

  }

}
