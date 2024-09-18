import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/errors/error_model.dart';
import 'package:dalel/core/errors/exceptions.dart';
import 'package:dalel/features/home/data/data_sources/home_local_data_source.dart';
import 'package:dalel/features/home/data/models/home_model.dart';



class HomeRemoteDataSource{

  final HomeLocalDataSource localDataSource = HomeLocalDataSource();

//method to get historical characters docs from collection and make them as list of HistoricalCharacterEntity
 Future<List<HistoricalCharacterModel>> getHistoricalCharactersList() async {
  print("+++++++>>>>> method in remote data called");
  try {
    final query = await FirebaseFirestore.instance.collection("historicalCharacters").get();
    print("+++++++>>>>> method in remote data fetched data ${query.docs.length} and ${query.docs[0].data()}");

    print("+++++++>>>>> method in remote data fetched data");
    List<HistoricalCharacterModel> historicalCharacters = query.docs
        .map((DocumentSnapshot doc){
      Map<String, dynamic> rawData = doc.data() as Map<String, dynamic>;
      print("Raw data: $rawData");
      //final jsonData = jsonDecode(rawData);
      return HistoricalCharacterModel.fromJson(rawData );
    })
        .toList();
    List<Map<String, dynamic>> cache = historicalCharacters.map((e) => e.toJson()).toList();
    localDataSource.cacheHistoricalCharactersList(cache);
    return historicalCharacters;
  } catch (error) {
    print("+++++++>>>>> method in remote data error and will throw exception ${error.toString()}");
    throw ServerException(ErrorModel(status: 0, errorMessage: error.toString()));
  }
}

  //method to get historical souvenirs docs from collection and make them as list of HistoricalSouvenirEntity
  Future<List<HistoricalSouvenirModel>> getHistoricalSouvenirsList() async {
    try {
      final query = await FirebaseFirestore.instance.collection("historicalSouvenirs").get();
      List<HistoricalSouvenirModel> historicalSouvenirs = query.docs.map((DocumentSnapshot doc) {
        final rawData = doc.data() as Map<String, dynamic>;
        return HistoricalSouvenirModel.fromJson(rawData);
      }).toList();
      List<Map<String, dynamic>> cache = historicalSouvenirs.map((e) => e.toJson()).toList();
      localDataSource.cacheHistoricalSouvenirsList(cache);
      return historicalSouvenirs;
    } catch (error) {
      throw ServerException(ErrorModel(status: 0, errorMessage: error.toString()));
    }
  }





}