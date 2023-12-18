import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:university_attendence/Registery%20Section/userdata.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController confirm= TextEditingController();
  TextEditingController name=TextEditingController();
  bool isSigningUp=false;
  final box=Hive.box('database');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.deepPurpleAccent,

      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [Lottie.asset('lib/icons/login.json',height: 200,width: 300),
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
                      controller: name,
                      decoration: InputDecoration(
                          hintText: 'Name',
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
                SizedBox(height: 10,),
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
                      decoration: InputDecoration(
                          hintText: 'Username',
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
                ),            SizedBox(height: 10,),

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
                      controller: email,
                      decoration: InputDecoration(
                          hintText: 'Email',
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
                ),            SizedBox(height: 10,),

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
                ),            SizedBox(height: 10,),

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
                      controller: confirm,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
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
                  child: TextButton(onPressed: (){
                    if(name.text.isEmpty || password.text.isEmpty || confirm.text.isEmpty || email.text.isEmpty)
                      {}
                    else if(password.text==confirm.text)
                      {
                        createUser(email.text, password.text);
                      }
                    else
                      {
                        createUser(email.text, password.text);
                      }

                  }, child: isSigningUp?CircularProgressIndicator(color: Colors.greenAccent,):Container(

                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Sign up',style: GoogleFonts.cabin(fontSize: 20,
                              color: Colors.white),),
                        )
                      ],
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUser(String email,String password)
  {
    final mAuth=FirebaseAuth.instance;
    mAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) async =>
    {
      if(mAuth.currentUser==null)
        {
          createUser(email, password)
        }
      else if(mAuth.currentUser!=null)
        { print(name.text+email),
          await createUserdata(context).whenComplete(() => isSigningUp=false,),
        }
    });
  }
  Future<void> createUserdata(BuildContext context) async {
    final auth = FirebaseAuth.instance;

    // Check if the user is authenticated
    if (auth.currentUser != null) {
      String uid = auth.currentUser!.uid;
      print(uid);

      final ref = FirebaseDatabase.instance.ref().child('Users'); // Use child() instead of ref()

      // Create a map representing the user data
      final userData = {
        'name': name.text,
        'email': email.text,
        'uid': uid,
      };

      // Use set() and then() for handling success and failure
      await box.put('name',name.text);
      await box.put('email', email.text);
      await box.put('logged in',true);
      await ref.child(uid).set(userData).then((_) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Account Data Successfully Uploaded'),
            );
          },
        );
      }).catchError((error) {
        print('Error uploading data: $error');
      });
    }
  }
}
