import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quit/widgets/new_quit_period_widget.dart';

import '../providers/quit_period.dart';
import '../widgets/period_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _startAddNewQuitPeriod(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return  NewQuitPeriod();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    QuitPeriod quitPeriod = Provider.of<QuitPeriod>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 70,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quit",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () => _startAddNewQuitPeriod(context),
                  child: Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: FutureBuilder<Map<String, QuitPeriodItem>>(
              future: quitPeriod.getQuitPeriods(),
              builder: (BuildContext context, AsyncSnapshot<Map<String, QuitPeriodItem>> snapshot){
                if( snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: Text('Please wait its loading...'));
                }else{
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_,index) =>PeriodWidget(instance: snapshot.data!.values.toList()[index],));
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
