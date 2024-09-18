import 'package:dalel/core/connection/network_info.dart';
import 'package:dalel/core/errors/exceptions.dart';
import 'package:dalel/core/errors/failure.dart';
import 'package:dalel/features/home/data/data_sources/home_local_data_source.dart';
import 'package:dalel/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:dalel/features/home/domain/entities/home_entity.dart';
import 'package:dalel/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {

  final NetworkInfo networkInfo;
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<HistoricalCharacterEntity>>> getHistoricalCharacters() async {
    if (await networkInfo.isConnected!) {
      // use remote data source
      print("+++++++>>>>> method in repositoryimpl and found internet is called");
      try {
        final remoteCharacters = await remoteDataSource.getHistoricalCharactersList();
        return Right(remoteCharacters);
      } on ServerException catch (e) {
        print("+++++++>>>>> method in repositoryimpl and found internet is called and error");
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      // use local data source
      final localCharacters = localDataSource.getCachedHistoricalCharactersList();
      return Right(localCharacters);
    }
  }

  @override
  Future<Either<Failure, List<HistoricalSouvenirEntity>>> getHistoricalSouvenirs() async {
    if (await networkInfo.isConnected!) {
      // use remote data source
      try {
        final remoteSouvenirs = await remoteDataSource.getHistoricalSouvenirsList();
        return Right(remoteSouvenirs);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      // use local data source
      final localSouvenirs = localDataSource.getCachedHistoricalSouvenirsList();
      return Right(localSouvenirs);
    }
  }
}