import 'package:dalel/features/home/domain/entities/home_entity.dart';

class HistoricalCharacterModel extends HistoricalCharacterEntity {

HistoricalCharacterModel({
  required super.name,
  required super.description,
  required super.imageUrl,
});

factory HistoricalCharacterModel.fromJson(Map<String, dynamic> json) {
  return HistoricalCharacterModel(
    name: json['name'],
    description: json['description'],
    imageUrl: json['imageUrl'],
  );
}

Map<String,dynamic> toJson() {
  return {
    'name': super.name,
    'description': super.description,
    'imageUrl': super.imageUrl,
  };
}



}


class HistoricalSouvenirModel extends HistoricalSouvenirEntity {


  HistoricalSouvenirModel({
    required super.name,
    required super.imageUrl,
  });

  factory HistoricalSouvenirModel.fromJson(Map<String, dynamic> json) {
    return HistoricalSouvenirModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String,dynamic> toJson() {
    return {
      'name': super.name,
      'imageUrl': super.imageUrl,
    };
  }
}