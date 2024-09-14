import 'package:dalel/core/databases/cache/cache_helper.dart';
import 'package:dalel/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
getIt.registerSingleton<AuthCubit>(AuthCubit());
getIt.registerSingleton<CacheHelper>(CacheHelper());


}