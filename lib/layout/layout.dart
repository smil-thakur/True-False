import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:true_false/layout/mobile.dart';
import 'package:true_false/layout/web.dart';
import 'package:true_false/screens/log_in.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return LoginScreen();
        } else {
          return WebScreen();
        }
      },
    );
  }
}
