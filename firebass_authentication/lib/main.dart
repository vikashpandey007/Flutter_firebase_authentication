import 'package:firebass_authentication/Login.dart';
import 'package:firebass_authentication/Signup.dart';
import 'package:flutter/material.dart';

void main() {
    runApp(Myapp());
}
 class Myapp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Sighn(),
     );
   }
 }