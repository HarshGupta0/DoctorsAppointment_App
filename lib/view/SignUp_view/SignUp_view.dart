import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/view/login_view/login_view.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.lightBlue.shade200.withBrightness,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2 * .7,
                      child: Container(
                        child: LottieBuilder.asset(
                          "assets/lottie/lottie2.json",
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Container(
                        child: SingleChildScrollView(
                          child: Form(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    " Welcome ",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                CustomTextField(
                                    hintText: AppStrings.fullnameHint, ispassword: false),
                                CustomTextField(
                                    hintText: AppStrings.emailHint, ispassword: false),
                                CustomTextField(
                                    hintText: AppStrings.passwordHint, ispassword: true),
                                CustomTextField(
                                    hintText: AppStrings.confirmPassword, ispassword: true),
                                CustomButton(onTap: () {}, ButtonText: AppStrings.signup),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                    child: Row(
                                  children: [
                                    Text("already have Acc!!"),
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                      },child: Text("Login"),),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              )
          ),
        ));
  }
}
