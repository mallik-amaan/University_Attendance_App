import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_attendence/ApDrawer.dart';
class CourseDetails extends StatefulWidget {
  final String title,
   creditHours,
   instructor_Name;
  const CourseDetails({super.key,
    required this.instructor_Name,
    required this.creditHours,
  required this.title});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,

      ),
      drawer:AppDrawer(),
    body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title,style: GoogleFonts.josefinSans(fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            ),Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.instructor_Name,style: GoogleFonts.josefinSans(fontSize: 15),),
              ],
            ),Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(widget.creditHours,style: GoogleFonts.josefinSans(fontSize: 15),),
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: 
                  BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                ),
                child: info(),
              ),
            )
        ],
        ),
      ),
    ),
    );
  }

  Quizzes() {
    return Container(child: Column(
      children: [
        ListTile(
        )
      ],
    ));
  }

  Assignments() {
    return ListTile();

  }

  MidTerms() {
    return ListTile();

  }

  Finals() {
    return ListTile();

  }
  Widget info(){
    return 
     Column(
      children: [
         ListTile(title: Text('Quiz'),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text('Max \nMarks'),
              Text('Obtained \nMarks'),
              Text('Average \nMarks'),
              Text('Percentage')],
            ),
            Quizzes(),
            ListTile(title: Text('Assignments'),),
            Assignments(),
            ListTile(title: Text('Mid Term'),),
            MidTerms(),
            ListTile(title: Text('Final'),),
            Finals(),

      ],
    );
  }
}
