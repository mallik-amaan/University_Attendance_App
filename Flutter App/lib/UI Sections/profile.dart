import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_attendence/ApDrawer.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset('lib/icons/dp.png',fit: BoxFit.fill,height: 200,width: 200,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [

                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('John',style: GoogleFonts.lora(fontSize: 30),)
                      ],
                    ),
                    ListTile(
                      title: Text('Semester : 3rd',style: GoogleFonts.josefinSans(fontSize: 20),textAlign: TextAlign.center,),
                    ),
                    ListTile(
                      title: Text('CGPA : 3.51',style: GoogleFonts.josefinSans(fontSize: 20),textAlign: TextAlign.center,),
                    ),
                    ListTile(
                      title: Text('Remarks : Excellent',style: GoogleFonts.josefinSans(fontSize: 20),textAlign: TextAlign.center,),
                    ),
                    ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('InVoices',style: GoogleFonts.josefinSans(fontSize: 25),),
                    ),
                    ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('Survey',style: GoogleFonts.josefinSans(fontSize: 25),),
                    ),
                    ListTile(              trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('Complain',style: GoogleFonts.josefinSans(fontSize: 25),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
