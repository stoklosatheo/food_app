import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromRGBO(254, 183, 77, 1);

class H1 extends StatelessWidget {
  const H1(this.myText, {this.myColor, super.key});

  final String myText;
  final Color? myColor;

  @override
  Widget build(BuildContext context) {
    if (myColor != null) {
      return Text(myText,
          style: GoogleFonts.pacifico(
              textStyle: TextStyle(
            color: myColor,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          )));
    } else {
      return Text(myText,
          style: GoogleFonts.pacifico(
              textStyle: const TextStyle(
            color: primaryColor,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          )));
    }
  }
}

class Subtitle extends StatelessWidget {
  const Subtitle(this.myText, {super.key});

  final String myText;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: GoogleFonts.nunitoSans(
          textStyle: const TextStyle(
        color: Color.fromRGBO(43, 48, 58, 1),
      )),
    );
  }
}
