import 'package:flutter/material.dart';

import '../widgets/custom_appbar_widget.dart';
import '../widgets/period_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          CustomAppBarWidget(title: "Quit"),
          Flexible(
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: [
                PeriodWidget(),
                PeriodWidget(),
                PeriodWidget(),
                PeriodWidget(),
                PeriodWidget(),
                PeriodWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
