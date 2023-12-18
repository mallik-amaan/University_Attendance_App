import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_attendence/ApDrawer.dart';
import 'package:university_attendence/UI%20Sections/CoursesView.dart';
class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {

  List coursedetails=[
    {'title':'Computer Science','instructor':'Prof Amaan','color':Colors.greenAccent,'image':'lib/icons/4401280.jpg','hours':'4'},
    {'title':'Digital Logic Design','instructor':'Prof Arshad','color':Colors.green,'image':'lib/icons/4401280.jpg','hours':'4'},
    {'title':'Data Structures','instructor':'Prof Ammar','color':Colors.greenAccent,'image':'lib/icons/4401280.jpg','hours':'2'},
    {'title':'Database Systems','instructor':'Prof Ehsan','color':Colors.pinkAccent,'image':'lib/icons/5362163.jpg','hours':'3'},
    {'title':'Applied Physics','instructor':'Prof Amaan','color':Colors.redAccent,'image':'lib/icons/6633.jpg','hours':'3'},
    {'title':'Algorithm Design','instructor':'Prof Akram','color':Colors.greenAccent,'image':'lib/icons/5362163.jpg','hours':'3'},


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Courses'),
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.deepPurpleAccent,
              child: Column(
                children: [
                  Text('Current Courses',style: GoogleFonts.josefinSans(fontSize: 30,color: Colors.white),),
                  Text('Total no of courses: ${coursedetails.length}',style: GoogleFonts.josefinSans(fontSize: 20,color: Colors.white),),
                  Text('Total no of credit hours: 19',style: GoogleFonts.josefinSans(fontSize: 20,color: Colors.white),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: coursedetails.length,
                        itemBuilder: (context,index) {
                         return CoursesView(
                            title: coursedetails[index]['title'],
                            bg: coursedetails[index]['image'],
                            bgcolor: coursedetails[index]['color'],
                            instructor: coursedetails[index]['instructor'],
                            CreditHours: coursedetails[index]['hours'],
                          );
                        }),
                    ),
                  ],
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
