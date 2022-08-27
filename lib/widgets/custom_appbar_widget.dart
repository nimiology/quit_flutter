import 'package:flutter/material.dart';

import '../providers/doing_provider.dart';
import '../providers/quit_period.dart';
import '../widgets/new_bottom_sheet_widget.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  bool back;
  String fieldText;
  Function addFunction;
  String? quitPeriodID;
  DoingItem? doingInstance;
  QuitPeriodItem? quitPeriodItem;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.fieldText,
    required this.addFunction,
    this.back = false,
    this.quitPeriodID,
    this.doingInstance,
    this.quitPeriodItem
  }) : super(key: key);

  void _startAddNewQuitPeriod(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewBottomSheet(
          className: title,
          fieldText: fieldText,
          addFunction: addFunction,
          quitPeriodID: quitPeriodID,
          quitPeriodItem: quitPeriodItem,
          doingInstance: doingInstance,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              if (back)
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              if (back)
                const SizedBox(
                  width: 15,
                ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w700),
              ),
            ],
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
    );
  }
}
