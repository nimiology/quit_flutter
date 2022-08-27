import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/doing_provider.dart';
import '../providers/quit_period.dart';

class NewBottomSheet extends StatefulWidget {
  String fieldText;
  String className;
  Function addFunction;
  String? quitPeriodID;
  DoingItem? doingInstance;
  QuitPeriodItem? quitPeriodItem;
  DateTime _selectedDate = DateTime.now();


  NewBottomSheet(
      {Key? key,
      required this.fieldText,
      required this.className,
      required this.addFunction,
      this.quitPeriodID,
      this.doingInstance,
      this.quitPeriodItem})
      : super(key: key);

  @override
  State<NewBottomSheet> createState() => _NewBottomSheetState();
}

class _NewBottomSheetState extends State<NewBottomSheet> {
  final _titleController = TextEditingController(text: '');
  String? id;


  void _submitData(QuitPeriod quitPeriod) {
    final String enteredTitle = _titleController.text;
    if (widget.quitPeriodID != null ||
        (widget.doingInstance == null &&
        widget.quitPeriodItem==null)) {
      widget.addFunction(id ?? widget._selectedDate.toString(), enteredTitle,
          widget._selectedDate, widget.quitPeriodID);
    } else {
      widget.addFunction(
          id ?? widget._selectedDate.toString(), enteredTitle, widget._selectedDate);
    }
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        widget._selectedDate = pickedDate;
        print(widget._selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    QuitPeriod quitPeriod = Provider.of<QuitPeriod>(context);
    if (widget.doingInstance != null) {
      _titleController.text = widget.doingInstance!.why ?? '';
      id = widget.doingInstance!.id;
    }
    if (widget.quitPeriodItem != null) {
      _titleController.text = widget.quitPeriodItem!.title;
      id = widget.quitPeriodItem!.id;
    }
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
              SizedBox(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget._selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(widget._selectedDate)}',
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
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
