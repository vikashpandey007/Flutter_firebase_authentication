import 'package:firebass_authentication/Homepage.dart';
import 'package:firebass_authentication/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Sighn extends StatefulWidget {
  @override
  _SighnState createState() => _SighnState();
}

class _SighnState extends State<Sighn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var vikas, x;

  Future<FirebaseUser> _handleSignIn() async {
    var result;
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    x = (user.displayName);
    print("fghgfghf:$x");
    return user;
  }

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController mobile = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "email"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mobile,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "mobile"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: Password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "password"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 200,
                  color: Colors.blue,
                  child: Text("Login"),
                  onPressed: () {
                    sign();
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 200,
                  child: Text("Sign up"),
                  color: Colors.blue,
                  onPressed: () {
                    sign();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Homepage()));
                  },
                ),
                FlatButton(
                  child: Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                  onPressed: () {
                    _handleSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sign() async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email.text,
      password: Password.text,
    ))
        .user;
    print(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }
}
