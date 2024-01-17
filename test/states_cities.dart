import 'dart:convert';

import 'city_model.dart';

class StatesCities {
  final int id;
  final String name;
  final String state_code;
  final int country_id;
  final List<City> cities;

  StatesCities(
    this.id,
    this.name,
    this.state_code,
    this.country_id,
    this.cities,
  );

  static List<StatesCities> fromListMap(List list) =>
      list.map((map) => StatesCities.fromMap(map)).toList();

  factory StatesCities.fromMap(Map map) {
    return StatesCities(
      map['id'] as int,
      map['name'] as String,
      map['state_code'] as String,
      map['country_id'] as int,
      List<City>.from(
        (map['cities'] as List).map((map) => City.fromMap(map)).toList(),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'state_code': state_code,
      'country_id': country_id,
      'cities': cities.map((city) => city.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory StatesCities.fromJson(String source) =>
      StatesCities.fromMap(json.decode(source) as Map<String, dynamic>);
}