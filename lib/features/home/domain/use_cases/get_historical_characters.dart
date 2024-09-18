import 'package:dalel/core/errors/failure.dart';
import 'package:dalel/features/home/data/repositories/home_repository_impl.dart';
import 'package:dalel/features/home/domain/entities/home_entity.dart';

import 'package:dartz/dartz.dart';

class GetHistoricalCharacters {


  final HomeRepositoryImpl repository;


  GetHistoricalCharacters({required this.repository});

  Future<Either<Failure,List<HistoricalCharacterEntity>>> call() async {
    return await repository.getHistoricalCharacters();
  }
}