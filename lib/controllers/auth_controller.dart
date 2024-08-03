import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebaseFunctions/Firebase_functions.dart';
import '../view/nav_screen/nav_screen.dart';
class AuthController extends GetxController{
  //signup
  var fullnameController =TextEditingController();
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  createUserWithEmailAndPassword(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = credential.user;
      if (user != null) {
        await storeUserData( credential.user!.uid , fullnameController.text,emailController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavScreen()));
        MySnackbar(context, "User Registered"," Welcome", Colors.green,Colors.white);

      } else {
        // Handle other cases here if needed
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MySnackbar(context, "Enter a strong Password","Weak password", Colors.orange.shade500,Colors.white);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        MySnackbar(context, "The account already exists for that email.", "Account already exists",Colors.brown.shade400,Colors.white);
        print('The account already exists for that email.');
      } else {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }








  //Store user Data
  storeUserData(String uid , String fullname, String email)async{
    var store =  FirebaseFirestore.instance.collection("users").doc(uid);
    await store.set({
      'fullname': fullname,
      'email':email
    });
  }
}