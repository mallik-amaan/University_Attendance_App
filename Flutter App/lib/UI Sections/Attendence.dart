import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_attendence/ApDrawer.dart';

import 'heat_map.dart';
class Atendence extends StatefulWidget {
  const Atendence({super.key});

  @override
  State<Atendence> createState() => _AtendenceState();
}

class _AtendenceState extends State<Atendence> {
  Map<DateTime,int> attendedclass={
  DateTime(2023,8,6):10,
  DateTime(2023,8,21):10,
  DateTime(2023,8,16):10,
  DateTime(2023,8,15):10,
  DateTime(2023,8,13):10,
  DateTime(2023,8,12):10,
  };
  bool checked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      backgroundColor: Colors.deepPurpleAccent,

        title: Text('Attendence'),

      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                callheatmap(),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 40.0,right:40),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Present',style: GoogleFonts.josefinSans(fontSize: 15),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Absent',style: GoogleFonts.josefinSans(fontSize: 15),),
                ],
              ),
            ),
            SizedBox(height: 5,),
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
                    ListTile(
                      title: Text('Today\'s Attendence:',style: GoogleFonts.josefinSans(
                          fontSize: 20
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checkbox(value: checked, onChanged: (value){
                                setState(() {
                                  checked=value!;
                                  if(checked)
                                    {
                                      attendedclass[DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day)]=10;
                                      callheatmap();
                                    }
                                  else if(!checked)
                                  {
                                    attendedclass.remove(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day));
                                    callheatmap();
                                  }
                                });
                              }),
                              SizedBox(width: 10,),
                              Text('Mark Attenence',style: GoogleFonts.josefinSans(
                                  fontSize: 20
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Overall Attendence:',style: GoogleFonts.josefinSans(
                          fontSize: 20
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text('Over all Attendence is 75%',style: GoogleFonts.josefinSans(fontSize: 20),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Atendence Bar',style: GoogleFonts.josefinSans(
                          fontSize: 20
                      ),),
                    ),
                    SimpleAnimationProgressBar(
                      borderRadius: BorderRadius.circular(15),
                        ratio: 0.75,
                        width: MediaQuery.of(context).size.width*0.7,
                        height: 30,
                        direction: Axis.horizontal,
                        backgroundColor: Colors.greenAccent,
                        foregrondColor: Colors.deepPurpleAccent, duration: Duration(seconds: 2),
                      curve: Curves.easeIn,

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
  MyHeatMap callheatmap()
  {
    return MyHeatMap(dataset:attendedclass);
  }
}
