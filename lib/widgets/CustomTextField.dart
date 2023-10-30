import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool ispassword;
  final TextEditingController ? textEditingController;

  CustomTextField({
    required this.hintText,
     this.textEditingController,
    required this.ispassword ,
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
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: TextFormField(
        obscureText: widget.ispassword,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(width: 2,color: Colors.blue),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.black45, // Change the color
          ),
          // Use the provided hint text
        ),
      ),
    );
  }
}
