import 'package:dalel/core/params/params.dart';
import 'package:dalel/features/auth/domain/entities/auth_entitiy.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AuthEntity>> getAuth(
      {required AuthParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
   //   final remoteAuth = await remoteDataSource.getAuth(params: params);
       //ocalDataSource.cacheAuth(remoteAuth??AuthModel());
        return Right(AuthEntity());
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localAuth = await localDataSource.getLastAuth();
        return Right(localAuth);
      } on CacheException catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
