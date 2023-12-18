import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Map<Tabs,dynamic> screens={};
  @override
  void initState() {
    // TODO: implement initState
    getUserdata();
    loadData();

    super.initState();
  }
  Future<void> loadData() async {
    await getData();
    setState(() {

    });
  }
  Future<void> getData()
  async {
    setState(() async {
      screens[Tabs.homescreen]=await box.get('homescreen');
      print(screens[Tabs.homescreen]);
      screens[Tabs.about]=await box.get('profile');
      screens[Tabs.attendence]=await box.get('courses');
      screens[Tabs.profile]=await box.get('notifications');
      screens[Tabs.notificatons]=await box.get('about');
      screens[Tabs.courses]=await box.get('attendence');
    });
    }
  final box=Hive.box('database');
  String? email;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //     image:AssetImage('lib/icons/menubg.jpg',),fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            DrawerHeader(child: Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 60,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text('${name}',style: GoogleFonts.labrada(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${email}',
                      style: GoogleFonts.josefinSans(
                        fontSize: 15
                      ),),
                    ],
                  )
                ],
              ),
            )),
            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/dash.png'),
                ),
                onTap: (){Navigator.pop(context);
                  Selected(Tabs.homescreen);
                Navigator.pushNamed(context,'homescreen');},

                title: Text('Dashboard'),
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/profile.png'
                    ,color: Colors.black54,),
                ),
                onTap: (){Navigator.pop(context);
                Selected(Tabs.profile);
                Navigator.pushNamed(context,'profile');},

                title: Text('Profile'),
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/user.png'),
                ),
                onTap: (){Navigator.pop(context);
                Selected(Tabs.attendence);
                Navigator.pushNamed(context,'attendence');},
                title: Text('Attendence'),
              ),
            ),

            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/book.png'
                  ,color: Colors.black87,
                  ),
                ),
                onTap: (){Navigator.pop(context);
                Selected(Tabs.courses);
                Navigator.pushNamed(context,'courses');},

                title: Text('Courses'),
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/notification.png'
                    ,color: Colors.black54,),
                ),
                onTap: (){Navigator.pop(context);
                Selected(Tabs.notificatons);
                Navigator.pushNamed(context,'notification');},
                title: Text('Notifications'),
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/information.png'
                  ,color: Colors.black54,),
                ),
                onTap: (){Navigator.pop(context);
                Selected(Tabs.about);
                Navigator.pushNamed(context,'about');},

                title: Text('About'),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child:Image.asset('lib/icons/logout.png'
                    ,color: Colors.black54,),
                ),
                onTap: (){
                  box.put('logged in',false);
                  Navigator.pushNamed(context, 'login');
                },
                title: Text('Logout'),
              ),
            ),

          ],
        ),
      ),
    );
  }
  void getUserdata ()
  async
  {
    final box=Hive.box('database');
    name=box.get('name');
    email=box.get('email');
  }
  void Selected(Tabs tab)
  {
    screens.forEach((key, value) {
      if(key==tab){
        value=true;
      }
      else
        {
          value=false;
        }
    });
    box.put('map',screens);
  }
}

class KeepAliveDrawer extends StatefulWidget {
  const KeepAliveDrawer({Key? key}) : super(key: key);

  @override
  _KeepAliveDrawerState createState() => _KeepAliveDrawerState();
}

class _KeepAliveDrawerState extends State<KeepAliveDrawer>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call super.build(context) to maintain state
    return AppDrawer();
  }
}
enum Tabs{
  homescreen,profile,attendence,courses,notificatons,about
}

