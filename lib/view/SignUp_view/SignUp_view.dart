import 'package:doctors_appointment/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctors_appointment/constants/strings.dart';
import 'package:doctors_appointment/widgets/CustomTextField.dart';
import 'package:doctors_appointment/widgets/customButton.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var controller = Get.put(AuthController());
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // TextEditingController nameController = TextEditingController(); // Changed variable name

  final _formKey = GlobalKey<FormState>(); // Added form key

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
                height: MediaQuery.of(context).size.height / 2 * .8,
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
                    key: _formKey, // Assigned the form key
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            " Welcome ",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomTextField(
                          hintText: AppStrings.fullnameHint,
                          isPassword: false,
                          textEditingController: controller.fullnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          hintText: AppStrings.emailHint,
                          isPassword: false,
                          textEditingController: controller.emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          hintText: AppStrings.passwordHint,
                          isPassword: true,
                          textEditingController: controller.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          textEditingController: confirmPasswordController,
                          hintText: AppStrings.confirmPassword,
                          isPassword: true,
                          validator: (value) {
                            if (value != confirmPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        CustomButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              controller
                                  .createUserWithEmailAndPassword(context);
                            }
                          },
                          ButtonText: AppStrings.signup,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text("already have Acc!!"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Login"),
                              ),
                            ],
                          ),
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
