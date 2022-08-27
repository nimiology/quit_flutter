import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/new_bottom_sheet_widget.dart';
import '../providers/doing_provider.dart';

class DoingWidget extends StatefulWidget {
  final DoingItem doing;

  const DoingWidget({Key? key, required this.doing}) : super(key: key);

  @override
  State<DoingWidget> createState() => _DoingWidgetState();
}

class _DoingWidgetState extends State<DoingWidget> {
  void _startAddNewQuitPeriod(BuildContext ctx, Doing doing) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewBottomSheet(
          className: "Quit Period",
          fieldText: "Why",
          addFunction: doing.addDoing,
          quitPeriodID: widget.doing.quitPeriodID,
          doingInstance: widget.doing,
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Color errorColor = Theme.of(context).errorColor;
    Doing doing = Provider.of<Doing>(context);
    DoingItem instance = widget.doing;
    Text? text;
    if (instance.why == "") {
      text = null;
    } else {
      text = Text(
        '${instance.why}',
        style: const TextStyle(color: Colors.white70),
      );
    }
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient:
              LinearGradient(colors: [errorColor, errorColor.withOpacity(0.7)]),
          boxShadow: [
            BoxShadow(
              color: errorColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            '${instance.createdDate.hour}:${instance.createdDate.minute}',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: text,
          trailing: SizedBox(
            width: 65,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => _startAddNewQuitPeriod(context, doing),
                  child: Icon(
                    Icons.edit,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () => doing.delete(instance.id),
                  child: Icon(
                    Icons.delete,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
