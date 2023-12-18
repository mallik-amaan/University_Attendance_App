import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_attendence/ApDrawer.dart';
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      backgroundColor: Color.fromARGB(255,246, 241, 248),
      ),
      drawer: AppDrawer(),
      backgroundColor: Color.fromARGB(255,246, 241, 248),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('This app is created by\nAmaan Ashraf',style: GoogleFonts.josefinSans(fontSize: 30),
                    textAlign:TextAlign.center ,),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(child: Image.asset('lib/icons/amaan.jpg',height: 300,width: 250,fit: BoxFit.fill,)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Text('created by developer at @Codify.pk\nVersion 1.0.0',style: GoogleFonts.josefinSans(fontSize: 15),textAlign: TextAlign.center,),

          ],
        ),
      ),

    );
  }
}
