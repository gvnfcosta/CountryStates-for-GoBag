import 'dart:convert';

CitiesModel citiesModelFromJson(String str) =>
    CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
  List<String> data;

  CitiesModel({required this.data});

  factory CitiesModel.fromJson(Map<String, dynamic> json) =>
      CitiesModel(data: List<String>.from(json["data"].map((x) => x)));

  Map<String, dynamic> toJson() =>
      {"data": List<dynamic>.from(data.map((x) => x))};
}
