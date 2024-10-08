import 'dart:convert';
import 'package:dalel/core/errors/exceptions.dart';
import 'package:dalel/features/auth/data/models/auth_model.dart';

import '../../../../core/databases/cache/cache_helper.dart';



class AuthLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedAuth";
  AuthLocalDataSource({required this.cache});

  cacheAuth(AuthModel? authToCache) {
    if (authToCache != null) {
      CacheHelper.saveData(
        key: key,
        value: json.encode(
          authToCache.toJson(),
        ),
      );
    } else {
      throw CacheException(errorMessage: "No Internet Connection");
    }
  }

  Future<AuthModel> getLastAuth() {
    final jsonString = CacheHelper.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(AuthModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException(errorMessage: "No Internet Connection");
    }
  }
}
