import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_false/methods/firestore_methods.dart';
import 'package:true_false/screens/question_screen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String res = "";
  getquestion() async {
    MyFirebase myFirebase = MyFirebase();
    res = await myFirebase.getQuestion();
    print(res);

    if (res == "success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => QuestionFeed()));
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getquestion();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Text(
              "Preparing Questions",
              style: GoogleFonts.inter(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        )),
      ),
    );
  }
}
