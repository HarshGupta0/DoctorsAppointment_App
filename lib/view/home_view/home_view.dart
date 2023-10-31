import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Welcome User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          backgroundColor:
              Colors.lightBlue.shade200.withBrightness,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                color: Colors.lightBlue.shade200.withBrightness,
                width: MediaQuery.of(context).size.width,
                child: CustomTextField(
                  hintText: AppStrings.searchHere,
                  ispassword: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
