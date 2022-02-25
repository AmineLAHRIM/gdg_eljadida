import 'package:dartz/dartz.dart';
import 'package:gdg_eljadida/app/core/errors/failure.dart';
import 'package:gdg_eljadida/app/data/models/event.dart';

abstract class EventRepo{
  Future<Either<Failure,List<Event>>> getEvents();
}