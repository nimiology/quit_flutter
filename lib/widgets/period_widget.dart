import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../providers/quit_period.dart';
import '../screens/quit_period_screen.dart';
import '../widgets/new_bottom_sheet_widget.dart';

class PeriodWidget extends StatefulWidget {
  final QuitPeriodItem instance;

  const PeriodWidget({Key? key, required this.instance}) : super(key: key);

  @override
  State<PeriodWidget> createState() => _PeriodWidgetState();
}

class _PeriodWidgetState extends State<PeriodWidget> {
  void _startAddNewQuitPeriod(BuildContext ctx, QuitPeriod quitPeriod) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewBottomSheet(
          className: "Quit",
          fieldText: "title",
          addFunction: quitPeriod.addQuitPeriod,
          quitPeriodItem: widget.instance,
        );
      },
    );
  }
  Color gradientColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  void _delete(QuitPeriod quitPeriod)async{
    quitPeriod.delete(widget.instance.id);
  }
  @override
  Widget build(BuildContext context) {
    QuitPeriod quitPeriod = Provider.of<QuitPeriod>(context);
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => QuitPeriodScreen(quitPeriod: widget.instance,)),
        );
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [gradientColor, gradientColor.withOpacity(0.7)]),
          boxShadow: [
            BoxShadow(
              color: gradientColor.withOpacity(0.3),
              spreadRadius: 8,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.instance.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              margin: const EdgeInsets.only(top: 37),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "15/30",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => _startAddNewQuitPeriod(context, quitPeriod),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: (){_delete(quitPeriod);},
                          child: Icon(
                            Icons.delete,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
