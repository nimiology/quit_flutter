import 'package:flutter/material.dart';
import 'package:quit/providers/doing_provider.dart';

class DoingWidget extends StatefulWidget {
  final Doing doing;

  const DoingWidget({Key? key, required this.doing}) : super(key: key);

  @override
  State<DoingWidget> createState() => _DoingWidgetState();
}

class _DoingWidgetState extends State<DoingWidget> {
  @override
  Widget build(BuildContext context) {
    Color errorColor = Theme.of(context).errorColor;
    Doing doing = widget.doing;
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          gradient: LinearGradient(
              colors: [errorColor, errorColor.withOpacity(0.7)]),
          boxShadow: [
            BoxShadow(
              color: errorColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            '${doing.date.hour}:${doing.date.minute}',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '${doing.why}',
            style: TextStyle(color: Colors.white70),
          ),
          trailing: Container(
            width: 65,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.delete,
                ),
              ],
            ),
          ),
        ));
  }
}
