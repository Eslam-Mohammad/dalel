import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/auth_entitiy.dart';
import '../repositories/auth_repository.dart';

class GetAuth {
  final AuthRepository repository;

  GetAuth({required this.repository});

  // Future<Either<Failure, AuthEntity>> call(
  //     {required AuthParams params}) {
  //   return repository.getAuth(params: params);
  // }
}
