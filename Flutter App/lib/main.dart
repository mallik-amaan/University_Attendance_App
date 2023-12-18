import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:university_attendence/Registery%20Section/signup.dart';
import 'package:university_attendence/UI%20Sections/Courses.dart';
import 'package:university_attendence/UI%20Sections/about.dart';
import 'package:university_attendence/UI%20Sections/notification.dart';
import 'package:university_attendence/UI%20Sections/profile.dart';

import 'Registery Section/login.dart';
import 'UI Sections/Attendence.dart';
import 'UI Sections/homescreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('database');
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String initialroute;
    final box=Hive.box('database');

    if(box.get('logged in')==null || !box.get('logged in'))
      {
        initialroute='login';
      }
    else
      {
        initialroute='homescreen';
      }
    return MaterialApp(
      initialRoute: initialroute,
      routes: {
        'homescreen':(context) =>const MyHomePage(title: 'University App'),
        'attendence':(context) =>const Atendence(),
        'courses':(context) =>const Courses(),
        'about':(context)=>const About(),
        'profile':(context)=>const Profile(),
        'login':(context)=>const Login(),
        'signup':(context)=>const SignUp(),
        'notification':(context)=>const Notifications(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'University App'),
    );
  }
}

enum Tabs{
  homescreen,profile,attendence,courses,notificatons,about
}

