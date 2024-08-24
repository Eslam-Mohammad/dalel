import '../../../../core/databases/api/api_consumer.dart';

import '../../../../core/params/params.dart';
import '../models/auth_model.dart';

class AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSource({required this.api});
  Future<AuthModel?> getAuth({required AuthParams params}) async {
   return Future.value();
  }
}
