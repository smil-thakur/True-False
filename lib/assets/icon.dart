import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final double width;
  const Logo({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "True",
            style: GoogleFonts.inter(
              fontSize: width,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "/",
            style: GoogleFonts.inter(
              fontSize: width,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "False",
            style: GoogleFonts.inter(
              fontSize: width,
            ),
          ),
        ],
      ),
    );
  }
}
