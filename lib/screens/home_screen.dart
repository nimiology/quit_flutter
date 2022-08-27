import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quit/widgets/new_quit_period_widget.dart';

import '../providers/quit_period.dart';
import '../widgets/period_widget.dart';
import '../widgets/custom_appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    QuitPeriod quitPeriod = Provider.of<QuitPeriod>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          CustomAppBar(
            title: "Quit",
            fieldText: "Title",
            addFunction: quitPeriod.addQuitPeriod,
          ),
          Flexible(
            child: FutureBuilder<Map<String, QuitPeriodItem>>(
              future: quitPeriod.getQuitPeriods(),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, QuitPeriodItem>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(
                    color: Colors.black.withOpacity(0.3),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => PeriodWidget(
                              instance: snapshot.data!.values.toList()[index],
                            ));
                  }
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
