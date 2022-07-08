import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String title;
  final double width;
  final Color color;
  const MyButton(
      {Key? key, required this.width, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.inter(),
        )),
      ),
    );
  }
}
