import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlue.shade200.withBrightness.withOpacity(.3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height/2,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                      child: Image.asset("assets/images/d2.png",
                      fit:BoxFit.fitWidth, width:MediaQuery.of(context).size.width,
                    ),),
                  )

              ),
              Container(
                  height: MediaQuery.of(context).size.height/2,
                  child:Container(
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
                              TextButton(onPressed: (){},child: Text("New User!!",style: TextStyle(fontSize: 16),),),
                            ],),
                          SizedBox(height: 20,),
                          CustomButton(onTap: (){}, ButtonText: AppStrings.login),
                        ],
                      ),
                    ),
                  ) ),
            ],
          ),
        )
      ),
    );
  }
}
