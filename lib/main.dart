import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:yogafit/category_card.dart';
import 'package:yogafit/profilepage.dart';
import 'package:yogafit/provider.dart';
import 'loginscreen.dart';
import 'welcomescreen.dart';
import 'homescreen.dart';
import 'package:yogafit/homescreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'exercisepage.dart';
import 'package:camera/camera.dart';
import 'package:yogafit/exercisepage.dart';
import 'package:yogafit/virtualtrainer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'registeruser.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final _auth = FirebaseAuth.instance;
String name;

dynamic user;
//var userEmail = objj;
String userPhoneNumber;

String objj;
List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //final cameras = await availableCameras();
 // final firstCamera = cameras.first;

  await Firebase.initializeApp();
  runApp(MyApp());
}
signOut() {

  return _firebaseAuth.signOut();
}
Future getCurrentUser() async {
  return objj = await currentuser.email;

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: welcomescreen(),
      initialRoute: MyHomePage.id,
      routes: {
          MyHomePage.id : (context) => welcomescreen(),
        'registeruser' : (context) => loginscreen(),
        '/productPage' : (context)=> exercisepage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
 // final List<CameraDescription> cameras;

  static String id = 'MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

   // print("${currentuser.user.uid}");
    String demo = FirebaseAuth.instance.currentUser.uid;
   // print("${demo}");
    FirebaseDatabase.instance.reference().child('Users/${currentuser}').once().then((DataSnapshot snapshot) {

     setState(() {
       name = snapshot.value['fullname'];
       //email = snapshot.value["email"];
     });
    });
    super.initState();
  }

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
            Navigator.push(context,MaterialPageRoute (builder: (_) => profilepage() ));
          },
          alignment: Alignment.topRight,
          iconSize: 50,
          icon: Icon(Icons.supervised_user_circle_rounded , color: Colors.black,) ,

        ),
      ),
      extendBodyBehindAppBar: true,
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
                child: Text("Good Evening \ ${name}", style: TextStyle(
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
                        String image = "assets/tree.png";
                        String Title = "Tree \n Yoga Pose";
                        //openExercisePage("plankgif.gif", "Plank yoga");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => exercisepage(
                                image: image, title: Title,
                              )),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Plank",
                      imagesrc: "assets/plank.png",
                      press: () {
                        String image = "assets/plankgif.gif";
                       String Title = "Plank \n ArmPose";
                        //openExercisePage("plankgif.gif", "Plank yoga");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => exercisepage(
                                image: image, title: Title,
                              )),
                        );
                      },
                    ),
                    CategoryCard(
                      title: "Warrior",
                      imagesrc: "assets/warrior.png",
                      press: () {
                        String image = "assets/warrior.png";
                        String Title = "Warrior \n Streachable";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => exercisepage(
                               image: image, title: Title,
                              )),
                        );

                      },
                    ),
                    CategoryCard(
                      title: "DownDog",
                      imagesrc: "assets/downdog2.png",
                      press: () {
                       String image = "assets/downdog2.png";
                        String Title = "DownDog \n Streachable";
                        //data;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => exercisepage(
                                image: image, title: Title,
                              )),
                        );

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
  /*void navigateUser() async{
    final storage = new FlutterSecureStorage();

    String value = await storage.read(key: key);
    Map<String, String> allValues = await storage.readAll();

    await storage.delete(key: key);
    await storage.deleteAll();

    await storage.write(key: key, value: value);

    FlutterSecureStorage prefs = await storage.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      Navigator.push(context,MaterialPageRoute (builder: (_) => MyHomePage() ));
    } else {
      Navigator.push(context,MaterialPageRoute (builder: (_) => loginscreen() ));
    }
  }*/

}class _SecItem {
  _SecItem(this.key, this.value);

  final String key;
  final String value;
}
