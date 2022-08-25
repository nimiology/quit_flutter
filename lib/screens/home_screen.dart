import 'package:flutter/material.dart';

import '../widgets/period_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Quit',
      //     style: TextStyle(
      //         color: Colors.black.withOpacity(0.4),
      //         fontWeight: FontWeight.w700),
      //   ),
      //   flexibleSpace: Container(
      //     color: Colors.white,
      //   ),
      // ),
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 65,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quit',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.add,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),
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
