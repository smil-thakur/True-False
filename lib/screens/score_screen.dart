import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:true_false/methods/google_signin.dart';
import 'package:true_false/screens/question_screen.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

Myshare() async {
  await Share.share("${user!.displayName}, score is $points in True/False",
      subject: "Check out my score in True/Flase");
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  user!.photoURL!,
                  width: 70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                user!.displayName!,
                style: GoogleFonts.inter(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Your total score:",
                style: GoogleFonts.inter(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                points.toString(),
                style: GoogleFonts.inter(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Share your score with your friends!",
                style: GoogleFonts.inter(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Myshare();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
