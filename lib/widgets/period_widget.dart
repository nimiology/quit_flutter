import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../providers/quit_period.dart';
import '../screens/quit_period_screen.dart';

class PeriodWidget extends StatefulWidget {
  final QuitPeriod instance;

  const PeriodWidget({Key? key, required this.instance}) : super(key: key);

  @override
  State<PeriodWidget> createState() => _PeriodWidgetState();
}

class _PeriodWidgetState extends State<PeriodWidget> {
  Color gradientColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QuitPeriodScreen()),

        );
      },
      child: Container(
        height: 150,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [gradientColor, gradientColor.withOpacity(0.7)]),
          boxShadow: [
            BoxShadow(
              color: gradientColor.withOpacity(0.3),
              spreadRadius: 8,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.instance.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.only(top: 37),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "15/30",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.white70,
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
