import 'package:flutter/cupertino.dart';

import '../helpers/db_helpers.dart';

class DoingItem {
  String? why;
  final String id;
  final DateTime createdDate;
  final String quitPeriodID;

  DoingItem(
      {required this.id,
      required this.createdDate,
      required this.quitPeriodID,
      this.why});

  static DoingItem DoingfromMap(Map data) {
    return DoingItem(
        id: data['id'],
        why: data['why'],
        quitPeriodID: data['quit_period_id'],
        createdDate: DateTime.fromMillisecondsSinceEpoch(data['created_date']));

  }
}

class Doing extends ChangeNotifier {
  Map<String, DoingItem> _items = {};

  Map<String, DoingItem> get items {
    return {..._items};
  }

  Future<Map<String, DoingItem>> getDoings() async {
    Map<String, DoingItem> _itemss = {};
    List doingsList = await DBHelper.getData('doing');
    for (DoingItem i
        in doingsList.map((element) => DoingItem.DoingfromMap(element))) {
      _itemss[i.id] = i;
    }
    _items = _itemss;
    return items;
  }

  void addDoing(String why, DateTime time, String quitPeriodID) {
    DoingItem instance =
        DoingItem(id: time.toString(), why: why, createdDate: time, quitPeriodID: quitPeriodID);
    Map<String, Object> data = {
      'id': instance.id,
      'created_date': instance.createdDate.millisecondsSinceEpoch,
      'quit_period_id': instance.quitPeriodID
    };
    data['why'] = instance.why!;
    DBHelper.insert('doing', data);
    _items[instance.id] = instance;
    notifyListeners();
  }

  void delete(String id) async {
    if (_items.containsKey(id)) {
      _items.removeWhere((key, value) => key == id);
      await DBHelper.delete("doing", id);
      notifyListeners();
    }
  }
}
