import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const HeaderText(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.fontWeight = FontWeight.bold,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Theme.of(context).colorScheme.secondaryContainer),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const BodyText(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Theme.of(context).colorScheme.secondaryContainer),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const Logo({
    super.key,
    this.text = "KOLLZBBQ",
    this.fontSize = 24,
    this.color = const Color(0xffFF7043),
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'KOLLZBBQ',
      textAlign: textAlign,
      style: GoogleFonts.lobster(
        textStyle: TextStyle(fontSize: 16, color: color),
      ),
    );
  }
}
