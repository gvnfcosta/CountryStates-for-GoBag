import 'dart:convert';

import 'state_model.dart';

class CountryStates {
  final String name;
  final String iso2;
  final String iso3;
  final String numeric_code;
  final String phone_code;
  final Map<String, dynamic> translations;
  final List<State> states;

  CountryStates(
    this.name,
    this.iso2,
    this.iso3,
    this.numeric_code,
    this.phone_code,
    this.translations,
    this.states,
  );

  static List<CountryStates> fromListMap(List list) =>
      list.map((map) => CountryStates.fromMap(map)).toList();

  factory CountryStates.fromMap(Map map) {
    return CountryStates(
      map['name'] as String,
      map['iso2'] as String,
      map['iso3'] as String,
      map['numeric_code'] as String,
      map['phone_code'] as String,
      Map<String, dynamic>.from(map['translations']),
      List<State>.from(
          (map['states'] as List).map((map) => State.fromMap(map)).toList()),
    );
  }

  static List<Map> toListMap(List<CountryStates> countries) =>
      countries.map((country) => country.toMap()).toList();

  factory CountryStates.fromJson(String source) =>
      CountryStates.fromMap(json.decode(source) as Map<String, dynamic>);

  // factory CountryStates.fromJson(Map<String, dynamic> map) => CountryStates(
  //       name: map['name'] as String,
  //       iso2: map['iso2'] as String,
  //       iso3: map['iso3'] as String,
  //       phone_code: map['phone_code'] as String,
  //       translations: Map<String, dynamic>.from(map['translations']),
  //       states: (map['states'] as List)
  //           .map((stateMap) => State.fromMap(stateMap))
  //           .toList(),
  //     );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'iso2': iso2,
      'iso3': iso3,
      'numeric_code': numeric_code,
      'phone_code': phone_code,
      'translations': translations,
      'states': states.map((state) => state.toMap()).toList(),
    };
  }
}
