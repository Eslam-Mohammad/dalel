import 'package:dalel/core/errors/failure.dart';
import 'package:dalel/features/home/domain/entities/home_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {

  Future<Either<Failure,List<HistoricalCharacterEntity>>> getHistoricalCharacters();

  Future<Either<Failure,List<HistoricalSouvenirEntity>>> getHistoricalSouvenirs();





}