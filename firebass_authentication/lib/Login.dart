import 'package:firebass_authentication/Homepage.dart';
import 'package:firebass_authentication/Signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Email"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "password"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  height: 40,
                  minWidth: 200,
                  color: Colors.blue,
                  child: Text("Login",style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  height: 40,
                  minWidth: 200,
                  child: Text("Sign up",style: TextStyle(color: Colors.white),),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sighn()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  child: Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.blue,fontSize: 17),
                  ),
                  onPressed: () {},
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
