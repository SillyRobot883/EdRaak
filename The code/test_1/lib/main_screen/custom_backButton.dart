import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomBackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100], // Semi-transparent background
          borderRadius: BorderRadius.circular(25), // Rounded corners
          border: Border.all(color: Colors.deepPurple, width: 2), // Gray border
        ),
        padding: EdgeInsets.all(8), // Padding for the icon
        child: Icon(
          Icons.arrow_back,
          color: Colors.deepPurple,
          size: 24, // Icon size
        ),
      ),
    );
  }
}
