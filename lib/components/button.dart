import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color buttonColor;
  final void Function()? onTap;

  const MyButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.buttonColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
