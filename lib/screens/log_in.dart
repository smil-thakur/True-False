import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_false/methods/google_signin.dart';
import 'package:true_false/screens/start.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: GoogleFonts.inter(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () async {
                Auth auth = Auth();
                User? user = await auth.signin();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StartMenu(
                      user: user!,
                    ),
                  ),
                );
              },
              child: Image.asset(
                "assets/google_logo.png",
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
