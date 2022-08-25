import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/quit_period.dart';

class NewQuitPeriod extends StatefulWidget {
  final Function callSetState;
  NewQuitPeriod({required this.callSetState});

  @override
  State<NewQuitPeriod> createState() => _NewQuitPeriodState();
}

class _NewQuitPeriodState extends State<NewQuitPeriod> {
  final _titleController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final QuitPeriod instance  = QuitPeriod.addQuitPeriod(enteredTitle);
    widget.callSetState();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextButton(
                child: Text('Add Quit Period'),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}