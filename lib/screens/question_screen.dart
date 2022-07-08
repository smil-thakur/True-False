import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:true_false/assets/button.dart';
import 'package:true_false/assets/life_bar.dart';
import 'package:true_false/assets/true_false.dart';
import 'package:true_false/main.dart';
import 'package:true_false/methods/firestore_methods.dart';
import 'package:true_false/screens/score_screen.dart';

int points = 0;
int qidx = 0;
bool isloading = false;
List<double> lifes = [1, 1, 1];
int mytime = 5;

class QuestionFeed extends StatefulWidget {
  const QuestionFeed({Key? key}) : super(key: key);

  @override
  State<QuestionFeed> createState() => _QuestionFeedState();
}

class _QuestionFeedState extends State<QuestionFeed> {
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    qidx = 0;
    isloading = false;
    lifes = [1, 1, 1];
    mytime = 5;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      mytime = mytime - 1;
      if (mounted) {
        setState(() {});
      }

      if (mytime <= 0) {
        ansskip();
        mytime = 5;
      }
      print(mytime);
    });
    super.initState();
  }

  ftimer() {
    if (mounted) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        mytime = mytime - 1;
        if (mounted) {
          setState(() {});
        }

        if (mytime <= 0) {
          ansskip();
          mytime = 5;
        }
        print(mytime);
      });
    }
  }

  changepage() async {
    MyFirebase myFirebase = MyFirebase();
    var format = DateFormat.yMMMd();
    var date = format.format(DateTime.now());
    await myFirebase.AddScore("score: ${points.toString()} played on: $date");
    await Future.delayed(Duration(milliseconds: 1000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ScoreScreen()));
  }

  checkAns(bool check) {
    if (ans[qidx] == check) {
      points = points + 10;
      mytime = 5;
      if (qidx + 1 > questions.length - 1) {
        points = points + 10;
        isloading = true;
        changepage();
      } else {
        qidx = qidx + 1;
        if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 1) {
          ;
        } else if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 0.5) {
          lifes[2] = 1;
        } else if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 0) {
          lifes[2] = 0.5;
        } else if (lifes[0] == 1 && lifes[1] == 0.5 && lifes[2] == 0) {
          lifes[1] = 1;
        } else if (lifes[0] == 1 && lifes[1] == 0 && lifes[2] == 0) {
          lifes[1] = 0.5;
        } else if (lifes[0] == 0.5 && lifes[1] == 0 && lifes[2] == 0) {
          lifes[0] = 1;
        }

        if (mounted) {
          setState(() {});
        }
      }

      if (mounted) {
        setState(() {});
      }
    } else {
      if (qidx + 1 > questions.length - 1) {
        isloading = true;
        changepage();
      } else {
        qidx = qidx + 1;
        if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 1) {
          lifes[2] = 0;
        } else if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 0.5) {
          lifes[2] = 0;
          lifes[1] = 0.5;
        } else if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 0) {
          lifes[1] = 0;
        } else if (lifes[0] == 1 && lifes[1] == 0.5 && lifes[2] == 0) {
          lifes[1] = 0;
          lifes[0] = 0.5;
        } else if (lifes[0] == 1 && lifes[1] == 0 && lifes[2] == 0) {
          lifes[0] = 0;
          isloading = true;
          changepage();
        } else if (lifes[0] == 0.5 && lifes[1] == 0 && lifes[2] == 0) {
          lifes[0] = 0;
          isloading = true;
          changepage();
        }
      }

      if (mounted) {
        setState(() {});
      }
    }
  }

  ansskip() {
    if (qidx + 1 > questions.length - 1) {
      isloading = true;
      changepage();
    } else {
      qidx = qidx + 1;
      if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 1) {
        lifes[2] = 0;
      } else if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 0.5) {
        lifes[2] = 0;
        lifes[1] = 0.5;
      } else if (lifes[0] == 1 && lifes[1] == 1 && lifes[2] == 0) {
        lifes[1] = 0;
      } else if (lifes[0] == 1 && lifes[1] == 0.5 && lifes[2] == 0) {
        lifes[1] = 0;
        lifes[0] = 0.5;
      } else if (lifes[0] == 1 && lifes[1] == 0 && lifes[2] == 0) {
        lifes[0] = 0;
        isloading = true;
        changepage();
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _timer.cancel();
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AbsorbPointer(
        absorbing: false,
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            isloading
                ? Container()
                : LifeBar(
                    life1: lifes[0],
                    life2: lifes[1],
                    life3: lifes[2],
                  ),
            const SizedBox(
              height: 100,
            ),
            isloading
                ? Container()
                : Container(
                    width: 350,
                    child: Text(
                      questions[qidx],
                      style: GoogleFonts.inter(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            const SizedBox(
              height: 50,
            ),
            isloading
                ? Container()
                : SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              checkAns(true);
                            },
                            child: const MyButton(
                                width: 100,
                                color: Colors.green,
                                title: "True")),
                        InkWell(
                            onTap: () {
                              checkAns(false);
                            },
                            child: const MyButton(
                                width: 100, color: Colors.red, title: "False")),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 100,
            ),
            Text(
              "Your points: ${points.toString()}",
              style: GoogleFonts.inter(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isloading
                ? Container()
                : Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                        child: Text(
                      mytime.toString(),
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                  ),
            isloading
                ? Container(
                    width: 120,
                    child: Column(
                      children: [
                        Text(
                          "Preparing Score Board",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ))
                : Container(),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
