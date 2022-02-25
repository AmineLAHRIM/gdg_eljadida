import 'package:dartz/dartz.dart';
import 'package:gdg_eljadida/app/core/errors/exceptions.dart';
import 'package:gdg_eljadida/app/core/errors/failure.dart';
import 'package:gdg_eljadida/app/core/network/network_info.dart';
import 'package:gdg_eljadida/app/data/datasources/local/local_event_repo.dart';
import 'package:gdg_eljadida/app/data/datasources/remote/remote_event_repo.dart';
import 'package:gdg_eljadida/app/data/models/event.dart';
import 'package:gdg_eljadida/app/data/repos/abstract/event_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EventRepo)
class EventRepoImpl implements EventRepo {
  NetworkInfo networkInfo;
  RemoteEventRepo remoteEventRepo;
  LocalEventRepo localEventRepo;

  EventRepoImpl(this.networkInfo,this.remoteEventRepo,this.localEventRepo);

  @override
  Future<Either<Failure, List<Event>>> getEvents() async {
    if (await networkInfo.isConnected()) {
      /// Here we will call the remote layer
      try {
        final events = await remoteEventRepo.getEvents();
        return Right(events);
      } on RemoteException catch (remoteExp) {
        return Left(ServerFailure(message: remoteExp.message));
      }
    } else {
      /// Here we will call the local layer
      try {
        final events = await localEventRepo.getEvents();
        return Right(events);
      } on CacheException catch (cacheExp) {
        return Left(CacheFailure(message: cacheExp.message));
      }
    }
  }
}
