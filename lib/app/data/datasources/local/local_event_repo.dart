import 'package:gdg_eljadida/app/core/errors/exceptions.dart';
import 'package:gdg_eljadida/app/data/models/event.dart';
import 'package:injectable/injectable.dart';

abstract class LocalEventRepo{
  Future<List<Event>> getEvents();
}

@LazySingleton(as: LocalEventRepo)
class LocalEventRepoImpl implements LocalEventRepo{
  @override
  Future<List<Event>> getEvents() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final list = [
        Event(id: 'id1', name: 'name', imageUrl: 'https://i.ibb.co/0syKD0V/event1.png'),
        Event(id: 'id2', name: 'nam2', imageUrl: 'https://i.ibb.co/qgJkC6Q/event2.png'),
        Event(id: 'id3', name: 'nam3', imageUrl: 'https://i.ibb.co/FbsBVXV/event3.png'),
        Event(id: 'id4', name: 'nam4', imageUrl: 'https://i.ibb.co/G00r03b/event4.png'),
        Event(id: 'id5', name: 'name5', imageUrl: 'https://i.ibb.co/PgJXb78/event5.png'),
        Event(id: 'id6', name: 'name6', imageUrl: 'https://i.ibb.co/MDmWF1n/event6.png'),
        Event(id: 'id7', name: 'name7', imageUrl: 'https://i.ibb.co/wQzSrx0/event7.png'),
      ];
      return list;
    } catch (e) {
      throw CacheException(message: 'cache error');
    }
  }

}