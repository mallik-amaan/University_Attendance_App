import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../ApDrawer.dart';
import 'CoursesView.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List coursedetails=[
    {'title':'Computer Science','instructor':'Prof Amaan','color':Colors.greenAccent,'image':'lib/icons/4401280.jpg','hours':'4'},
    {'title':'Digital Logic Design','instructor':'Prof Arshad','color':Colors.greenAccent,'image':'lib/icons/4401280.jpg','hours':'4'},
    {'title':'Islamic Studies','instructor':'Prof Ammar','color':Colors.greenAccent,'image':'lib/icons/4401280.jpg','hours':'2'},
    {'title':'Principles of Acconting','instructor':'Prof Ehsan','color':Colors.pinkAccent,'image':'lib/icons/5362163.jpg','hours':'3'},
    {'title':'Applied Physics','instructor':'Prof Amaan','color':Colors.redAccent,'image':'lib/icons/6633.jpg','hours':'3'},
    {'title':'Calculas 2','instructor':'Prof Akram','color':Colors.greenAccent,'image':'lib/icons/5362163.jpg','hours':'3'},
  ];
  final box=Hive.box('database');
  void putData() async {
    await box.put('homescreen',true);
    await box.put('profile',false);
    await box.put('attendence',false);
    await box.put('courses',false);
    await box.put('about',false);
    await box.put('notifications',false);
  }
  @override
  void initState() {
    putData();
    // TODO: implement initState
    print(box.get('homescreen'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Dashboard'),
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.deepPurpleAccent,
      //drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Text("Learn on \nthe Go",
              style: GoogleFonts.libreBaskerville(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
              textAlign: TextAlign.center,),
            ),
            Expanded(
              child: Container(
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  //height: MediaQuery.of(context).size.height*,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: hometabs(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
  Widget hometabs(){
    PageController pagecontroller=new PageController(initialPage: 1);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Explore more',style: GoogleFonts.roboto(
                  fontSize: 35,
                  color: Colors.deepPurpleAccent
                ),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  height: 40,width: 40,
                  child: Icon(Icons.arrow_forward_outlined,color: Colors.white,),
                )
              ],
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10),
            child: Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Courses',style: GoogleFonts.roboto(fontSize: 20,color: Colors.black),),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   newCourses('Photography',Colors.greenAccent,'lib/icons/photographer_1.png',4),
                   SizedBox(width: 20,),
                   newCourses('Digital Marketing',Colors.lightBlueAccent, 'lib/icons/photographer_1.png', 4.5,),
                   SizedBox(width: 20,),
                   newCourses('Ethical Hacking',Colors.deepOrangeAccent, 'lib/icons/photographer_1.png', 3.3,),
                 ],
               ),
             ),
          SizedBox(height: 20,),
      
        ],
      ),
    );
  }
  Widget newCourses(String name,Color color,String image,double initialrate) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      width: 350,
      height: 500,
      child: Column(
        children: [
          Text(
            '${name}',
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Container(
            height: 300,
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('${image}'),
              ),
            ),
          ),
          Text('Ratings'),
          RatingBar(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border_outlined,
            onRatingChanged: (rating) {
              // Add your logic here for handling rating changes
            },
            initialRating: initialrate,
            maxRating: 5,
            alignment: Alignment.center,
            filledColor: Colors.yellow,
            size: 30,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              onPressed: () {
                // Add your logic here for the button's onPressed event
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enrol now',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
