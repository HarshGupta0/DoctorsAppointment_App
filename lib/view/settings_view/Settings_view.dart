import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String _numberCtrl = "8505063481";

  @override
  void initState() {
    super.initState();
    _numberCtrl = "8505063481";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: Text("Profile", style: TextStyle(fontWeight: FontWeight.w500)),
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade200,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade200,
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
                    SizedBox(width: 45.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
                        ),
                        const Text("Harsh@123.gmail.com",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
              CardWidget("Address", Icons.location_on, () {}),
              CardWidget("Privacy and Policy", Icons.privacy_tip_outlined, () {}),
              CardWidget("Help Line", Icons.phone, () async {
                await FlutterPhoneDirectCaller.callNumber(_numberCtrl);
                print("pressed");
              }),
              CardWidget("Contact Us", Icons.mail_outline_sharp, () {
                composeEmail("iharshgupta.2003@gmail.com", "Subject", "Body");
              }),
              CardWidget("Logout", Icons.logout, () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardWidget(String input, IconData icon, VoidCallback onTap) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade200,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 30),
            SizedBox(width: 40.w),
            Text(
              input,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Future<void> composeEmail(String to, String subject, String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: to,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      if (await canLaunch(emailLaunchUri.toString())) {
        await launch(emailLaunchUri.toString());
      } else {
        throw 'Could not launch email';
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }
}
