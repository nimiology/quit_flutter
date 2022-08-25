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
    Doing doing = widget.doing;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).accentColor,
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
      ),
    );
  }
}
