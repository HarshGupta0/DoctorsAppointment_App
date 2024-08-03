import 'package:doctors_appointment/view/login_view/login_view.dart';
import 'package:doctors_appointment/view/nav_screen/nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// SnackBar
MySnackbar( BuildContext Context,String message, String heading ,Color bgcolor ,Color textcolor) {
  Get.snackbar(
    heading, // Title of the snackbar
    message, // Message to be shown
    // snackPosition: SnackPosition.BOTTOM,
    backgroundColor: bgcolor,
    colorText:textcolor,
    borderRadius: 10,
    margin: EdgeInsets.all(10),
  );
}
// SignUp Function
createUserWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
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

// Sign-In Function
Future<void> signInWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  // Show loading indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavScreen()));
      MySnackbar(context, "Login Successfully", "Success", Colors.black12.withOpacity(.6),Colors.white);
    } else {
      // Handle other cases here if needed
    }
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context); // Hide loading indicator
    if (e.code == 'user-not-found') {
      MySnackbar(context, "No user found for that email.", "Error", Colors.red.shade200.withOpacity(.6), Colors.white);
    } else if (e.code == 'wrong-password') {
      MySnackbar(context, "Wrong password provided for that user.", "Error", Colors.red.shade200.withOpacity(.6), Colors.white);

    } else {
      MySnackbar(context, "Error code: ${e.code}", "Error", Colors.red.shade200.withOpacity(.6), Colors.white);
    }
  } catch (e) {
    Navigator.pop(context);
    MySnackbar(context,"An error occurred: $e", "Error", Colors.red.shade200.withOpacity(.6), Colors.white);
// Hide loading indicator
  }
}


// Signout Function
Signout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
}
