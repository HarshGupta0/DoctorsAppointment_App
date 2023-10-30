import 'package:doctors_appointment/constants/strings.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final String ButtonText;
  const CustomButton({
   required this.onTap,
    required this.ButtonText,
    super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), // Set the background color
        fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/3, 45)), // Set the width and height
      ),
      onPressed:widget.onTap,
      child: Text(
        widget.ButtonText,
        style: TextStyle(
          color: Colors.white, // Set the text color
          fontSize: 19, // Set the text font size
        ),
      ),
    );
  }
}
