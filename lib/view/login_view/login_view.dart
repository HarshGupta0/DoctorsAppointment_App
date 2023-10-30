import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/view/SignUp_view/SignUp_view.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.lightBlue.shade200.withBrightness.withOpacity(.3),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/2*.7+20,
                        child: Container(
                          child:LottieBuilder.asset("assets/lottie/lottie3.json",
                            width:MediaQuery.of(context).size.width,
                          ),),
                      ),
                      SizedBox(height: 10,),
                      Container(
                          child:SingleChildScrollView(
                            child: Form(
                              child: Column(
                                children: [
                                  Center(child: Text("Login Here",style: TextStyle(color: Colors.black45,fontSize: 32,fontWeight: FontWeight.bold),),),
                                  SizedBox(height: 20,),
                                  CustomTextField(hintText: AppStrings.emailHint, ispassword:false),
                                  CustomTextField(hintText:AppStrings.passwordHint,ispassword:true),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(onPressed: (){},child: Text("Forget Password?",style: TextStyle(fontSize: 16),),),
                                      TextButton(onPressed: (){Get.to(()=>SignUpView());},child: Text("New User!!",style: TextStyle(fontSize: 16),),),
                                    ],),
                                  SizedBox(height: 20,),
                                  CustomButton(onTap: (){},
                                      ButtonText: AppStrings.login),
                                ],
                              ),
                            ),
                          ) ),
                    ],
                  ),
                )
              ],
            ),
      ),
    ));
  }
}
