import '../helpers/db_helpers.dart';

class QuitPeriod{
  String id;
  String title;
  final DateTime createdDate;
  QuitPeriod({required this.id, required this.title, required this.createdDate});

  static QuitPeriod addQuitPeriod(String title){
    DateTime time = DateTime.now();
    QuitPeriod instance = QuitPeriod(id: time.toString(), title: title, createdDate: time);
    DBHelper.insert('quit_period', {
      'id': instance.id,
      'title': instance.title,
      'created_date': instance.createdDate.millisecondsSinceEpoch,
    });
    return instance;

  }
  static QuitPeriod QuietPeriodfromMap(Map data){
    return QuitPeriod(id: data['id'], title: data['title'], createdDate: DateTime.fromMicrosecondsSinceEpoch(data['created_date']));
  }
  static Future<List> getQuitPeriods() async{
    List QuitPeriodsList = await DBHelper.getData('quit_period');
    return QuitPeriodsList.map((element)=>QuitPeriod.QuietPeriodfromMap(element)).toList();
  }
}