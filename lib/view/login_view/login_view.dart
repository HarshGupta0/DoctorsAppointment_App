import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/firebaseFunctions/Firebase_functions.dart';
import 'package:doctors_appointment/view/SignUp_view/SignUp_view.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check for user persistence on app start
    // checkUserPersistence();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlue.shade200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2 * .7 + 20,
                child: Container(
                  child: LottieBuilder.asset(
                    "assets/lottie/lottie3.json",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.all(8.w),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Login Here",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField(
                          hintText: AppStrings.emailHint,
                          isPassword: false,
                          textEditingController: emailController,
                        ),
                        CustomTextField(
                          hintText: AppStrings.passwordHint,
                          isPassword: true,
                          textEditingController: passwordController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpView()));
                              },
                              child: Text(
                                "New User!!",
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        CustomButton(
                          onTap: () {
                            signInWithEmailAndPassword(emailController.text, passwordController.text, context);
                          },
                          ButtonText: AppStrings.login,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
