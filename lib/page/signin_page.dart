import 'package:flutter/material.dart';
import 'package:objectdatabase/Model/Users.dart';
import 'package:objectdatabase/servece/object_database.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController? _email;
  TextEditingController? _password;
  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password= TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _email?.dispose();
    _password?.dispose();
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
                    Container(

                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            fit: BoxFit.contain,

                            image: AssetImage(
                                'assets/images/profileee.jfif'
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Welcome" , style: TextStyle(color: Colors.grey ,fontSize: 16),),
                    Text("Sign In", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),

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
                            controller: _password,
                            decoration:InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black),

                            ) ,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Forgot Password?" ,style: TextStyle(color: Colors.grey, fontSize: 14, )),
                          SizedBox(
                            height: 25,
                          ),

                          MaterialButton(
                              onPressed: (){
                                  var user = User(_email.toString(),_password.toString());
                                  ObjectDatabase.getUser(user);
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
                                child: Text("Sign In" ,style: TextStyle(color: Colors.white ,fontSize: 20),)  ,

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
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?" ,style: TextStyle(fontSize: 14,color: Colors.grey),),
                              Text("Sign Up" ,style: TextStyle(fontSize: 14,color: Colors.lightGreen),),
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