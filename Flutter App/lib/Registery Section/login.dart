import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final box=Hive.box('database');
  String? name;
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  bool isLoggingin=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.12),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [Lottie.asset('lib/icons/login.json',height: 300,width: 300),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 190, 173,250),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)
                        )
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: GoogleFonts.laila(fontSize: 20,color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight:Radius.circular(20),
                              bottomLeft:Radius.circular(20)
                        ),
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0,right: 35,top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 190, 173,250),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)
                      )
                    ),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.laila(fontSize: 20,color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Colors.white,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.only(
                                topRight:Radius.circular(20),
                                bottomLeft:Radius.circular(20)
                            ),                      )
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:32.0,left: 16,right: 16),
                  child: isLoggingin?CircularProgressIndicator(
                    color: Colors.greenAccent,
                  ):TextButton(onPressed: () async {
                    setState(() {
                      isLoggingin=true;
                    });
                     await signIn(email.text,password.text);
                   // Navigator.pushNamed(context, 'homescreen');

                  }, child: Container(

                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Sign in',style: GoogleFonts.cabin(fontSize: 20,
                            color: Colors.white),),
                      )
                    ],
                  ),
                  )),
                ),
                SizedBox(height: 45,),
                Container(
                  height: MediaQuery.of(context).size.height*0.41,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 35,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(color:Colors.white,width: MediaQuery.of(context).size.width*0.3,height: 5,)
                          ,
                          Text("Sign Up",style: GoogleFonts.josefinSans(fontSize: 35,color: Colors.white),),
                          Container(color:Colors.white,width: MediaQuery.of(context).size.width*0.3,height: 5,)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.17,),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                            Image.asset('lib/icons/google.png',height: 30,width: 30,) ,
                             Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Text('Sign up with Google',style: GoogleFonts.josefinSans(fontSize: 20),),
                             ),
                          ],),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.17,),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                            Image.asset('lib/icons/facebook.png',height: 30,width: 30,) ,
                             Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Text('Sign up with Facebook',style: GoogleFonts.josefinSans(fontSize: 20),),
                             ),
                          ],),
                        ),
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'signup');
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.17),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Image.asset('lib/icons/email.png',height: 30,width: 30,) ,
                               Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child: Text('Sign up with Email',style: GoogleFonts.josefinSans(fontSize: 20),),
                               ),
                            ],),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> getUserdata ()
  async {
    final mAuth=FirebaseAuth.instance;
    String uid=mAuth.currentUser!.uid;
    final ref=FirebaseDatabase.instance.ref('Users').child(uid);
    await ref.once().then((value) {
      setState(() {
        name=value.snapshot.child('name').value.toString();
      });
    });
  }
  Future<void> signIn(String email, String password) async {
    try {
      final mAuth = FirebaseAuth.instance;
      await mAuth.signInWithEmailAndPassword(email: email, password: password);

      if (mAuth.currentUser != null) {
        // Perform asynchronous operations here
        await getUserdata();

        // Update the state once the async operations are done
        setState(() {
          isLoggingin = false;
        });

        await box.put('name', name);
        await box.put('email', email);
        await box.put('logged in', true);
        Navigator.pushNamed(context, 'homescreen');
      }
    } catch (error) {
      // Handle login error here
      setState(() {
        isLoggingin = false;
      });
      print("Login Error: $error");
    }
  }

}
