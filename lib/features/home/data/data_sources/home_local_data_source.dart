import 'dart:convert';

import 'package:dalel/core/databases/cache/cache_helper.dart';
import 'package:dalel/features/home/data/models/home_model.dart';

class HomeLocalDataSource{


 // method to put historical characters list in cache
   void cacheHistoricalCharactersList(List<Map<String,dynamic>> docs) {
    if(docs.isEmpty){
      return;
    }
    String key = 'historical_characters';
    String jsonString = jsonEncode(docs);
    CacheHelper.saveData(key: key, value: jsonString);


  }

// method to put historical souvenirs list in cache
  void cacheHistoricalSouvenirsList(List<Map<String,dynamic>> docs) {
   if (docs.isEmpty) {
     return;
   }
   String key = 'historical_souvenirs';
   String jsonString = jsonEncode(docs);
   CacheHelper.saveData(key: key, value: jsonString);
 }

// method to get historical characters list from cache
 List<HistoricalCharacterModel> getCachedHistoricalCharactersList() {
  String key = 'historical_characters';
  final jsonString =CacheHelper.getData(key: key);
  if(jsonString == null){
    return [];
  }
  final List<dynamic> docs =jsonDecode(jsonString) as List<dynamic>;
  return docs.map((e) => HistoricalCharacterModel.fromJson(e as Map<String, dynamic>)).toList();
}

// method to get historical souvenirs list from cache
List<HistoricalSouvenirModel> getCachedHistoricalSouvenirsList() {
  String key = 'historical_souvenirs';
  final jsonString = CacheHelper.getData(key: key);
  if (jsonString == null) {
    return [];
  }
  final List<dynamic> docs = jsonDecode(jsonString) as List<dynamic>;

  return docs.map((e) => HistoricalSouvenirModel.fromJson(e)).toList();
}


}

