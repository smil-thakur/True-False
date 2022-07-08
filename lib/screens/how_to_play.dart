import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 300,
            child: Center(
                child: Text(
              "How to play?\n Click on the start button to play the game\nYou will have 5 secs to ans either true or false for the given question\nYou have 3 life bar\nEach wrong answer takes 1 health bar\nRight answer will fetch you 0.5 health bar",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                height: 1.5,
                fontSize: 15,
              )),
            )),
          ),
        ),
      ),
    );
  }
}
