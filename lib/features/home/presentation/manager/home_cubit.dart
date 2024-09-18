import 'package:dalel/core/connection/network_info.dart';
import 'package:dalel/features/cart/presentation/pages/cart_screen.dart';
import 'package:dalel/features/home/data/data_sources/home_local_data_source.dart';
import 'package:dalel/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:dalel/features/home/data/repositories/home_repository_impl.dart';
import 'package:dalel/features/home/domain/use_cases/get_historical_characters.dart';
import 'package:dalel/features/home/domain/use_cases/get_historical_souvenirs.dart';
import 'package:dalel/features/home/presentation/manager/home_states.dart';
import 'package:dalel/features/home/presentation/pages/home_main_screen.dart';
import 'package:dalel/features/profile/presentation/pages/profile_screen.dart';
import 'package:dalel/features/search/presentation/pages/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dartz/dartz.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangedIndex());
  }

  List appScreens =  [
    const HomeMainScreen(),
    const CartScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

 List<dynamic> historicalCharacters = [];
  void getHistoricalCharacters() async {
    print("+++++++>>>>> method in cubit is called");
    emit(GetHistoricalCharactersLoading());
    final result = await GetHistoricalCharacters(repository: HomeRepositoryImpl(
        networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
        localDataSource: HomeLocalDataSource(),
        remoteDataSource: HomeRemoteDataSource())).call();
    result.fold(
          (failure) => emit(GetHistoricalCharactersError(failure.errMessage)),


          (list) {
        historicalCharacters = list;
        emit(GetHistoricalCharactersSuccess(list));
          }

    );
  }

  List<dynamic> historicalSouvenirs = [];
  void getHistoricalSouvenirs() async {
    emit(GetHistoricalSouvenirsLoading());
    final result = await GetHistoricalSouvenirs(repository: HomeRepositoryImpl(
        networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
        localDataSource: HomeLocalDataSource(),
        remoteDataSource: HomeRemoteDataSource())).call();
    result.fold(
          (failure) => emit(GetHistoricalSouvenirsError(failure.errMessage)),
          (list) {
        historicalSouvenirs = list;
        emit(GetHistoricalSouvenirsSuccess(list));
          }
    );
  }


}