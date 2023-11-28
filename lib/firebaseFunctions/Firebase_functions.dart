import 'package:doctors_appointment/view/home_view/home_view.dart';
import 'package:doctors_appointment/view/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Function to save user UID to shared preferences
void _saveUserUid(String uid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('uid', uid);
}

// Function to get user UID from shared preferences
// Future<String?> _getUserUid() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString('uid');
// }

// SignUp Function
createUserWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      _saveUserUid(user.uid);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
      MySnackbar(context, "User Registered", Colors.green);
    } else {
      // Handle other cases here if needed
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      MySnackbar(context, "Weak password", Colors.orange.shade500);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      MySnackbar(context, "The account already exists for that email.", Colors.brown.shade400);
      print('The account already exists for that email.');
    } else {
      print(e);
    }
  } catch (e) {
    print(e);
  }
}

// SnackBar
MySnackbar(BuildContext context, String Message, Color colors) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colors,
      content: Text(Message),
    ),
  );
}

// Sign-In Function
signInWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      _saveUserUid(user.uid);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
      MySnackbar(context, "Login Successfully", Colors.green);
    } else {
      // Handle other cases here if needed
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      MySnackbar(context, "No user found for that email.", Colors.red);
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      MySnackbar(context, "Wrong password provided for that user", Colors.red);
      print('Wrong password provided for that user.');
    } else {
      print('Error code: ${e.code}');
    }
  }
}

// Signout Function
Signout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  _saveUserUid(''); // Clear the user UID from shared preferences
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
}
