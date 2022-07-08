import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_false/assets/button.dart';
import 'package:true_false/methods/firestore_methods.dart';
import 'package:true_false/methods/google_signin.dart';
import 'package:true_false/screens/how_to_play.dart';
import 'package:true_false/screens/loading.dart';
import 'package:true_false/screens/log_in.dart';
import 'package:true_false/screens/question_screen.dart';
import 'package:true_false/screens/score_history.dart';

class StartMenu extends StatelessWidget {
  final User user;
  const StartMenu({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      Auth auth = Auth();
                      await auth.signout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MyButton(
                          title: "Sign Out", width: 100, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  user.photoURL!,
                  width: 70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                user.displayName!,
                style: GoogleFonts.inter(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  // MyFirebase myFirebase = MyFirebase();
                  // await myFirebase.getQuestion();
                  qidx = 0;
                  points = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loading(),
                    ),
                  );
                },
                child: const MyButton(
                  title: "Start",
                  width: 100,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HowToPlay(),
                    ),
                  );
                },
                child: Text(
                  "How to Play?",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScoreHistory()));
              },
              child: const Icon(
                Icons.star,
                size: 50,
                color: Colors.blue,
              ),
            ),
            Text(
              "My Scores",
              style: GoogleFonts.inter(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
