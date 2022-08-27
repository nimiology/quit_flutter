import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/calender_widget.dart';
import '../widgets/doing_widget.dart';
import '../providers/doing_provider.dart';
import '../widgets/custom_appbar_widget.dart';
import '../providers/quit_period.dart';
import '../screens/quit_period_screen.dart';

class QuitPeriodScreen extends StatefulWidget {
  QuitPeriodItem quitPeriod;

  QuitPeriodScreen({required this.quitPeriod});

  @override
  State<QuitPeriodScreen> createState() => _QuitPeriodScreenState();
}

class _QuitPeriodScreenState extends State<QuitPeriodScreen> {
  DateTime selectedDate = DateTime.now();

  Future<List<DoingItem>> doingsFilter(Doing doing) async {
    List<DoingItem> theList = [];
    Map<String, DoingItem> mapDoingItems = await doing.getDoings();
    List<DoingItem> listDoingItems = mapDoingItems.values.toList();
    for (DoingItem element in listDoingItems) {
      if (element.quitPeriodID == widget.quitPeriod.id &&
          element.createdDate.year == selectedDate.year &&
          element.createdDate.month == selectedDate.month &&
          element.createdDate.day == selectedDate.day) {
        theList.add(element);
      }
    }
    return theList;
  }

  void changeSelectedDate(DateTime time) {
    selectedDate = time;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Doing doing = Provider.of<Doing>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Quit Period",
              back: true,
              fieldText: "Why",
              addFunction: doing.addDoing,
              quitPeriodID: widget.quitPeriod.id,
            ),
            const SizedBox(
              height: 5,
            ),
            CalenderWidget(changeSelectedDate: changeSelectedDate),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Divider(
                  thickness: 1,
                )),
            Flexible(
              child: FutureBuilder<List<DoingItem>>(
                future: doingsFilter(doing),
                builder: (BuildContext context,
                    AsyncSnapshot<List<DoingItem>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: Colors.black.withOpacity(0.3),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return ListView.builder(
                          padding: const EdgeInsets.only(top: 17.5),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => DoingWidget(
                                doing: snapshot.data![index],
                              ));
                    }
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
