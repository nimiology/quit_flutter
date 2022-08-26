import 'package:flutter/material.dart';
import 'package:quit/providers/doing_provider.dart';

class DoingWidget extends StatefulWidget {
  final DoingItem doing;

  const DoingWidget({Key? key, required this.doing}) : super(key: key);

  @override
  State<DoingWidget> createState() => _DoingWidgetState();
}

class _DoingWidgetState extends State<DoingWidget> {
  @override
  Widget build(BuildContext context) {
    Color errorColor = Theme.of(context).errorColor;
    DoingItem doing = widget.doing;
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
            '${doing.createdDate.hour}:${doing.createdDate.minute}',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            '${doing.why}',
            style: const TextStyle(color: Colors.white70),
          ),
          trailing: SizedBox(
            width: 65,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => print('sdf'),
                  child: Icon(
                    Icons.edit,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () => print('sdf'),
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
