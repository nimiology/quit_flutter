import 'package:flutter/material.dart';

import '../providers/doing_provider.dart';
import '../widgets/calender_widget.dart';
import '../widgets/doing_widget.dart';

class TableBasicsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quit Period'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('Pressed'),
      ),
      body: Column(
        children: [
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
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
                DoingWidget(doing: Doing(date: DateTime.now(), why: "Hello")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
