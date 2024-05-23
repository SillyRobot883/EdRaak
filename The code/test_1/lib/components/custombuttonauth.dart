import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButtonAuth({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: MaterialButton(
        height: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.tajawal(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
