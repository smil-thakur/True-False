import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:true_false/assets/button.dart';

class TrueFalse extends StatefulWidget {
  const TrueFalse({Key? key}) : super(key: key);

  @override
  State<TrueFalse> createState() => _TrueFalseState();
}

class _TrueFalseState extends State<TrueFalse> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(width: 100, color: Colors.green, title: "True"),
          MyButton(width: 100, color: Colors.red, title: "False"),
        ],
      ),
    );
  }
}
