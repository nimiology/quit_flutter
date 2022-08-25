import 'package:quit/helpers/db_helpers.dart';

class Doing {
  String? why;
  final String id;
  final DateTime createdDate;

  Doing({required this.id, required this.createdDate, this.why});

  static Doing addDoing(String why) {
    DateTime time = DateTime.now();
    Doing instance = Doing(id: time.toString(), why: why, createdDate: time);
    Map<String, Object> data = {
      'id': instance.id,
      'created_date': instance.createdDate.millisecondsSinceEpoch,
    };
    data['why'] = instance.why!;
    DBHelper.insert('doing', data);
    return instance;
  }

  static Doing DoingfromMap(Map data) {
    return Doing(
        id: data['id'],
        why: data['title'],
        createdDate: DateTime.fromMicrosecondsSinceEpoch(data['created_date']));
  }

  static Future<List> getDoings() async {
    List QuitPeriodsList = await DBHelper.getData('doing');
    return QuitPeriodsList.map((element) => Doing.DoingfromMap(element))
        .toList();
  }
  delete()async{
    await DBHelper.delete("doing", this.id);
  }
}
