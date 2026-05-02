import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/models/Button_Model.dart';

class CustomButton extends StatelessWidget {
  final ButtonModel button;

  const CustomButton({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: button.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: button.onPressed,
      child: Text(
        button.text,
        style: GoogleFonts.cairo(
          fontSize: width * 0.045,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
