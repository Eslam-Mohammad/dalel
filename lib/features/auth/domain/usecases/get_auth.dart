
import '../repositories/auth_repository.dart';

class GetAuth {
  final AuthRepository repository;

  GetAuth({required this.repository});

  // Future<Either<Failure, AuthEntity>> call(
  //     {required AuthParams params}) {
  //   return repository.getAuth(params: params);
  // }
}
