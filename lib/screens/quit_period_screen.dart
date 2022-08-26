import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quit/providers/doing_provider.dart';
import 'package:quit/widgets/doing_widget.dart';

import '../widgets/calender_widget.dart';
import '../widgets/period_widget.dart';

class QuitPeriodScreen extends StatefulWidget {
  @override
  State<QuitPeriodScreen> createState() => _QuitPeriodScreenState();
}

class _QuitPeriodScreenState extends State<QuitPeriodScreen> {
  @override
  Widget build(BuildContext context) {
    Doing doing = Provider.of<Doing>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          "Quit",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  InkWell(
                    onTap: () => null,
                    child: Icon(
                      Icons.add,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const CalenderWidget(),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Divider(
                  thickness: 1,
                )),
            Flexible(
              child: FutureBuilder<Map<String, DoingItem>>(
                future: doing.getDoings(),
                builder: (BuildContext context, AsyncSnapshot<Map<String, DoingItem>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text('Please wait its loading...'));
                  } else {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return ListView.builder(
                          padding: const EdgeInsets.only(top: 17.5),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => DoingWidget(
                                doing: snapshot.data!.values.toList()[index],
                              ));
                    } // snapshot.data  :- get your object which is pass from your downloadData() function
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
