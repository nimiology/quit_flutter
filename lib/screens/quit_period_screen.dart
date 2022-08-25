import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quit/widgets/custom_appbar_widget.dart';

import '../widgets/calender_widget.dart';
import '../widgets/new_quit_period_widget.dart';
import '../providers/quit_period.dart';
import '../widgets/period_widget.dart';

class QuitPeriodScreen extends StatefulWidget {
  @override
  State<QuitPeriodScreen> createState() => _QuitPeriodScreenState();
}

class _QuitPeriodScreenState extends State<QuitPeriodScreen> {
  @override
  Widget build(BuildContext context) {
    List<QuitPeriod> quietPeriods = [];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarWidget(title: "Quit Period", modal: NewQuitPeriod(callSetState: (){setState((){});}),),
            SizedBox(height: 5,),
            const CalenderWidget(),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Divider(
                  thickness: 1,
                )),
            Flexible(
              child: FutureBuilder<List>(
                future: QuitPeriod.getQuitPeriods(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                  if( snapshot.connectionState == ConnectionState.waiting){
                    return  Center(child: Text('Please wait its loading...'));
                  }else{
                    if (snapshot.hasError)
                      return Center(child: Text('Error: ${snapshot.error}'));
                    else
                      return ListView.builder(
                          padding: const EdgeInsets.only(top: 17.5),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_,index) =>PeriodWidget(instance: snapshot.data![index],));  // snapshot.data  :- get your object which is pass from your downloadData() function
                  }
                },

              ),
              ),
          ],
        ),
      ),
    );
  }
}
