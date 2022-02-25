
import 'package:dartz/dartz.dart';
import 'package:gdg_eljadida/app/core/errors/failure.dart';
import 'package:gdg_eljadida/app/data/models/event.dart';
import 'package:gdg_eljadida/app/data/repos/abstract/event_repo.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EventService {
  var events = <Event>[].obs;
  EventRepo eventRepo;

  EventService(this.eventRepo);

  Future<Either<Failure,List<Event>>> getEvents() async{
    final failureOrEvents = await eventRepo.getEvents();
    failureOrEvents.fold((l) {}, (_events) => events.assignAll(_events));
    return failureOrEvents;
  }

  void favorite({required int index, required bool isFav}) {
    final event = events[index];
    event.isFavorite = !event.isFavorite;
    events[index] = event;
  }
}