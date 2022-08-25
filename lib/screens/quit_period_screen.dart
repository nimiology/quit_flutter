import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quit/widgets/custom_appbar_widget.dart';

import '../providers/doing_provider.dart';
import '../widgets/calender_widget.dart';
import '../widgets/doing_widget.dart';

class QuitPeriodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(title: "Quit Period"),
            SizedBox(height: 5,),
            const CalenderWidget(),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Divider(
                  thickness: 1,
                )),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.only(top: 17.5),
                children: [
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                  DoingWidget(doing: Doing(id: Random().nextInt(200), date: DateTime.now(), why: "Hello")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
