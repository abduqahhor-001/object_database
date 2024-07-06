import 'package:flutter/material.dart';
import 'package:objectdatabase/Model/Users.dart';
import 'package:objectdatabase/Model/newUsers.dart';

import '../servece/object_database.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController? _email;
  TextEditingController? _number;
  TextEditingController? _address;
  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _number= TextEditingController();
    _address= TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _email?.dispose();
    _number?.dispose();
    _address?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreen,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [

                  Text("Welcome" , style: TextStyle(color: Colors.grey ,fontSize: 16),),
                  Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(40) ,topRight: Radius.circular(40))
              ),
              padding: EdgeInsets.all(30),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _email,
                      decoration:InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.black,
                      ) ,
                    ),
                    TextField(
                      controller: _number,
                      decoration:InputDecoration(
                        labelText: "number",
                        labelStyle: TextStyle(color: Colors.black),

                      ) ,
                    ),
                    TextField(
                      controller: _address,
                      decoration:InputDecoration(
                        labelText: "address",
                        labelStyle: TextStyle(color: Colors.black),

                      ) ,
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    MaterialButton(
                      onPressed: (){

                        ObjectDatabase.getUser(Newusers(_email.toString(),_number.toString(),_address.toString()) as User);
                        var getuser = ObjectDatabase.checkUser();
                        print(getuser.toJson().toString());
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10,bottom: 10,),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text("Sign Up" ,style: TextStyle(color: Colors.white ,fontSize: 20),)  ,

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Or" ,style: TextStyle(color: Colors.grey, fontSize: 14, )),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.blue,),
                        SizedBox(
                          width: 35,
                        ),
                        Icon(Icons.facebook,color: Colors.lightBlue,),
                        SizedBox(
                          width: 35,
                        ),
                        Icon(Icons.facebook),
                      ],
                    ),


                  ],

                ),
              ),
            ))
          ],
        ),
      ),

    );
  }
}
