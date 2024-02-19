import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? textEditingController;
  final Color textColor; // Changed to 'Color'
  final String? Function(String?)? validator; // Add validator function

  CustomTextField({
    required this.hintText,
    required this.textEditingController,
    this.textColor = Colors.black54,
    this.isPassword = false,
    this.validator, // Initialize validator
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.r),
      margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: TextFormField(
          obscureText: widget.isPassword,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2.w, color: Colors.blue),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.textColor, // Use the provided text color
            ),
          ),
          validator: widget.validator, // Assign the validator function
        ),
      ),
    );
  }
}
