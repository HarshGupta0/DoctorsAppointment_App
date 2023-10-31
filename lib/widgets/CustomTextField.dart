import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool ispassword;
  final TextEditingController? textEditingController;
  final Color textColor; // Changed to 'Color'

  CustomTextField({
    required this.hintText,
    this.textEditingController,
    this.textColor = Colors.black54,
    this.ispassword = false,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          obscureText: widget.ispassword,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 2, color: Colors.blue),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.textColor, // Use the provided text color
            ),
          ),
        ),
      ),
    );
  }
}
