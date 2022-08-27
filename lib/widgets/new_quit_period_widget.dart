import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quit_period.dart';

class NewBottomSheet extends StatefulWidget {
  String fieldText;
  String className;
  Function addFunction;
  String? quitPeriodID;

  NewBottomSheet({
    Key? key,
    required this.fieldText,
    required this.className,
    required this.addFunction,
    this.quitPeriodID,
  }) : super(key: key);

  @override
  State<NewBottomSheet> createState() => _NewBottomSheetState();
}

class _NewBottomSheetState extends State<NewBottomSheet> {
  final _titleController = TextEditingController();

  void _submitData(QuitPeriod quitPeriod) {
    final String enteredTitle = _titleController.text;

    if (widget.quitPeriodID != null){
      widget.addFunction(enteredTitle, widget.quitPeriodID);
    } else {
      widget.addFunction(enteredTitle);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    QuitPeriod quitPeriod = Provider.of<QuitPeriod>(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: widget.fieldText),
                controller: _titleController,
                onSubmitted: (_) => _submitData(quitPeriod),
              ),
              TextButton(
                child: Text('Add ${widget.className}'),
                onPressed: () => _submitData(quitPeriod),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
