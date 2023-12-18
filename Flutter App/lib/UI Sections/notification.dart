import 'package:flutter/material.dart';
import 'package:university_attendence/ApDrawer.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Text(
          'Notifications from the University appears here'
        ),
      ),
    );
  }
}
