import 'package:doctors_appointment/view/home_view/home_view.dart';
import 'package:doctors_appointment/view/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (
          BuildContext context, Widget? child) {
        return MaterialApp(
          home:
          FirebaseAuth.instance.currentUser==null?LoginView():HomeView(),
        );
      },
    );
  }
}

