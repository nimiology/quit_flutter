import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quit_period.dart';

class NewQuitPeriod extends StatefulWidget {
  const NewQuitPeriod({Key? key}) : super(key: key);

  @override
  State<NewQuitPeriod> createState() => _NewQuitPeriodState();
}

class _NewQuitPeriodState extends State<NewQuitPeriod> {
  final _titleController = TextEditingController();

  void _submitData(QuitPeriod quitPeriod) {
    final enteredTitle = _titleController.text;
    quitPeriod.addQuitPeriod(enteredTitle);
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
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(quitPeriod),
              ),
              TextButton(
                child: const Text('Add Quit Period'),
                onPressed: ()=>_submitData(quitPeriod),
              ),
            ],
          ),
        ),
      ),
    );
  }
}