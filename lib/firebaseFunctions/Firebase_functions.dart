import 'package:doctors_appointment/view/home_view/home_view.dart';
import 'package:doctors_appointment/view/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



// SignUp Function
createUserWithEmailAndPassword( String emailAddress,String password,BuildContext context)async{
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user =credential.user;
    if(user !=null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
      MySnackbar(context,"User Registered",Colors.green);
    }else{}
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      MySnackbar(context,"weak-password",Colors.orange.shade500);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      MySnackbar(context,"The account already exists for that email.",Colors.brown.shade400);
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}


// SnackBar
MySnackbar(BuildContext context,String Message, Color colors) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colors,
      content: Text(Message),
    ),
  );
}




// Sign-In Function
// Sign-In Function
signInWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
      MySnackbar(context, "Login Successfully", Colors.green);
    } else {
      // Handle other cases here if needed
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
      MySnackbar(context, "No user found for that email.", Colors.red);
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      MySnackbar(context, "Wrong password provided for that user", Colors.red);
      print('Wrong password provided for that user.');
    } else {
      // Handle other error cases here
      print('Error code: ${e.code}');
    }
  }
}






//Sign out Function
Signout (BuildContext context) async{
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
}


