import 'package:dalel/core/errors/failure.dart';
import 'package:dalel/features/home/domain/entities/home_entity.dart';
import 'package:dalel/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetHistoricalSouvenirs {

  final HomeRepository repository;
  GetHistoricalSouvenirs({required this.repository});

  Future<Either<Failure,List<HistoricalSouvenirEntity>>> call() async {
    return await repository.getHistoricalSouvenirs();
  }


}