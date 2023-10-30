import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Container(

          color: Colors.lightBlue.shade200.withBrightness.withOpacity(.3),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height/2,
                    child: Container(
                        child:LottieBuilder.asset("assets/lottie/lottie2.json",
                          fit:BoxFit.fitWidth,
                          width:MediaQuery.of(context).size.width,
                        ),),
                ),
                Container(
                    height: MediaQuery.of(context).size.height/2,
                    child:Container(
                      child: Form(
                        child: Column(
                          children: [
                            Center(child: Text("Welcome Here",style: TextStyle(color: Colors.black45,fontSize: 30,fontWeight: FontWeight.bold),),),
                            SizedBox(height: 10,),
                            CustomTextField(hintText: AppStrings.signup, ispassword:false),
                            CustomTextField(hintText:AppStrings.passwordHint,ispassword:false),
                            SizedBox(height: 20,),
                            CustomTextField(hintText: AppStrings.signup, ispassword:false),
                            CustomTextField(hintText:AppStrings.passwordHint,ispassword:false),
                            CustomButton(onTap: (){}, ButtonText: AppStrings.signup),
                          ],
                        ),
                      ),
                    ) ),
              ],
            ),
          )
      ),
    ),);
  }
}
