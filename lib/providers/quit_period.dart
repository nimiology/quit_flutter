import 'package:flutter/cupertino.dart';

import '../helpers/db_helpers.dart';

class QuitPeriodItem {
  final String id;
  String title;
  DateTime createdDate;

  QuitPeriodItem(
      {required this.id, required this.title, required this.createdDate});

  static QuitPeriodItem QuietPeriodfromMap(Map data) {
    return QuitPeriodItem(
        id: data['id'],
        title: data['title'],
        createdDate: DateTime.fromMillisecondsSinceEpoch(data['created_date']));
  }
}

class QuitPeriod extends ChangeNotifier {
  Map<String, QuitPeriodItem> _items = {};

  Map<String, QuitPeriodItem> get items {
    return {..._items};
  }

  void addQuitPeriod(String id,String title, DateTime time,) {
    QuitPeriodItem instance =
        QuitPeriodItem(id: id, title: title, createdDate: time);
    DBHelper.insert('quit_period', {
      'id': instance.id,
      'title': instance.title,
      'created_date': instance.createdDate.millisecondsSinceEpoch,
    });
    _items[instance.id] = instance;
    notifyListeners();
  }

  Future<Map<String, QuitPeriodItem>> getQuitPeriods() async {
    Map<String, QuitPeriodItem> _itemss = {};
    List QuitPeriodsList = await DBHelper.getData('quit_period');
    for (QuitPeriodItem i in QuitPeriodsList.map(
        (element) => QuitPeriodItem.QuietPeriodfromMap(element))) {
      _itemss[i.id] = i;
    }
    _items = _itemss;
    return items;
  }

  void delete(String id) async {
    if (_items.containsKey(id)) {
      _items.removeWhere((key, value) => key==id);
      await DBHelper.delete("quit_period", id);
      notifyListeners();
    }
  }
}
