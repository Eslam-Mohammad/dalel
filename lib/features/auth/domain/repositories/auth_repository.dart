import 'package:dalel/core/params/params.dart';
import 'package:dalel/features/auth/domain/entities/auth_entitiy.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';



abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> getAuth(
      {required AuthParams params});
}
