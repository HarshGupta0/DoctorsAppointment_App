import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade200,
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width:double.infinity,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:Colors.lightBlue.shade200,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35.r,
                        backgroundColor: Colors.grey.shade400,
                        child: ClipOval(
                          child: Container(
                            width: 70.w,
                            height: 70.h,
                            child: LottieBuilder.asset(
                              "assets/Doc_lottie/Animation - 1708336077598.json",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 45.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          Text("Harsh@123.gmail.com",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}
