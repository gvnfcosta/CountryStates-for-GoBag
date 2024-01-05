import 'dart:convert';

CountryStateModel countryStateModelFromJson(String str) =>
    CountryStateModel.fromJson(json.decode(str));

class CountryStateModel {
  List<Country> data;

  CountryStateModel({
    required this.data,
  });

  factory CountryStateModel.fromJson(Map<String, dynamic> json) =>
      CountryStateModel(
        data: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
      );
}

class Country {
  String name;
  String iso3;
  String iso2;
  List<State> states;

  Country({
    required this.name,
    required this.iso3,
    required this.iso2,
    required this.states,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        iso3: json["iso3"],
        iso2: json["iso2"],
        states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
      );
}

class State {
  String name;

  State({
    required this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"],
      );
}
