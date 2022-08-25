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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Dismissible(
          key: ObjectKey(doing.id),
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).errorColor,
            ),
            child: const Icon(
              Icons.delete,
              size: 30,
            ),
          ),
          onDismissed: (direction) {
            setState(() {});
          },
          child: Container(
            color: Theme.of(context).accentColor,
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
                width: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
