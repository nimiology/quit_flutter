import 'package:flutter/material.dart';

import '../widgets/period_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quit !'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView(
        children: [
          PeriodWidget(),
          PeriodWidget(),
          PeriodWidget(),
          PeriodWidget(),
          PeriodWidget(),
          PeriodWidget(),
        ],
      ),
    );
  }
}
