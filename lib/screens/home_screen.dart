import 'package:flutter/material.dart';
import 'package:quit/widgets/new_quit_period_widget.dart';

import '../providers/quit_period.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/period_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          CustomAppBarWidget(title: "Quit", modal: NewQuitPeriod(callSetState: (){setState((){});},)),
          Flexible(
            child: FutureBuilder<List>(
              future: QuitPeriod.getQuitPeriods(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                if( snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: Text('Please wait its loading...'));
                }else{
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_,index) =>PeriodWidget(instance: snapshot.data![index],));
                  }  // snapshot.data  :- get your object which is pass from your downloadData() function
                }
              },

            ),
          ),
        ]),
      ),
    );
  }
}
