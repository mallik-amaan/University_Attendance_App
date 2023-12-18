import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_attendence/UI%20Sections/coursedetails.dart';

class CoursesView extends StatefulWidget {
  String title;
  String CreditHours;
  String instructor;
  String bg;
  Color bgcolor;
  CoursesView({
    super.key,
    required this.title,
    required this.bg,
    required this.bgcolor,
    required this.CreditHours,
    required this.instructor,
  });

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(context, 
        MaterialPageRoute(builder: (context)=>
            CourseDetails(instructor_Name: widget.instructor,
                creditHours: widget.CreditHours,
                title: widget.title)
        ));
        },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.bgcolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children:[
                         Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title,style: GoogleFonts.labrada(fontSize: 25),),
                          Text('Instructor: ${widget.instructor}',style: GoogleFonts.josefinSans(fontSize:18),),
                          Text('Credit Hours: ${widget.CreditHours}',style: GoogleFonts.josefinSans(fontSize:18),),
                        ],
                        ),
                      ]),
                      ClipOval(child: Image.asset(widget.bg,height: 100,width: 100,fit: BoxFit.cover,))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
enum Courses{
  course1,course2,course3,course4,course5,course6,
}
