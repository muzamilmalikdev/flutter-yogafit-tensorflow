import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:yogafit/category_card.dart';
import 'loginscreen.dart';
import 'welcomescreen.dart';
import 'homescreen.dart';
import 'package:yogafit/homescreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'exercisepage.dart';
import 'package:yogafit/exercisepage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: welcomescreen(),
      routes: {
        '/productPage' : (context)=> exercisepage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xfff8f8f8),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.43,
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
                child: Text("Good Morning \nMUZI", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                ),),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search,
                      size: 30,),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                fontSize: 20
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.count(crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: <Widget>[
                     CategoryCard(
                      title: "Tree",
                      imagesrc: "assets/tree.png",
                      press: () {

                      },
                    ),
                    CategoryCard(
                      title: "Plank",
                      imagesrc: "assets/plank.png",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return exercisepage();
                          }),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Warrior",
                      imagesrc: "assets/warrior.png",
                      press: () {

                      },
                    ),
                    CategoryCard(
                      title: "DownDog",
                      imagesrc: "assets/downdog2.png",
                      press: () {

                      },
                    ),


                    //categoryWidget('tree', "Tree"),

                  ],
                ),
              ),

            ],
          )
        ],
      ),

    );

  }
  Container categoryWidget(String img, String title) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      //width: MediaQuery.of(context).size.width*0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(0, 10),
          )
          ]
      ),
      child: InkWell(
        onTap: () {
           openExercisePage('$img', '$title');
        }, /* to be changed to next screen */
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/$img.png'),
                        fit: BoxFit.contain
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              child: Text('$title', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ), textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );

  }
  void openExercisePage(String img, String title)
  {
    Navigator.pushNamed(context, '/productPage', arguments: {'image':'$img', 'title':'$title'});
  }
}
