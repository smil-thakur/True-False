import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LifeBar extends StatefulWidget {
  final double life1;
  final double life2;
  final double life3;
  const LifeBar(
      {Key? key, required this.life1, required this.life2, required this.life3})
      : super(key: key);

  @override
  State<LifeBar> createState() => _LifeBarState();
}

class _LifeBarState extends State<LifeBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.life1 == 1
              ? Container(
                  height: 20,
                  width: 20,
                  color: Colors.white,
                )
              : widget.life1 == 0.5
                  ? Container(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 20,
                            color: Colors.white,
                          ),
                          Container(
                            width: 10,
                            height: 20,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  : widget.life1 == 0
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                        )
                      : Container(),
          const SizedBox(
            width: 20,
          ),
          widget.life2 == 1
              ? Container(
                  height: 20,
                  width: 20,
                  color: Colors.white,
                )
              : widget.life2 == 0.5
                  ? Container(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 20,
                            color: Colors.white,
                          ),
                          Container(
                            width: 10,
                            height: 20,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  : widget.life2 == 0
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                        )
                      : Container(),
          const SizedBox(
            width: 20,
          ),
          widget.life3 == 1
              ? Container(
                  height: 20,
                  width: 20,
                  color: Colors.white,
                )
              : widget.life3 == 0.5
                  ? Container(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 20,
                            color: Colors.white,
                          ),
                          Container(
                            width: 10,
                            height: 20,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  : widget.life3 == 0
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                        )
                      : Container(),
        ],
      ),
    );
  }
}
