// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final String name;
  final String iso2;
  final String iso3;
  final List<State> states;

  Country({
    required this.name,
    required this.iso2,
    required this.iso3,
    required this.states,
  });

  factory Country.fromJson(String json) {
    return Country.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'iso3': iso3,
      'iso2': iso2,
      'states': states.map((x) => x.toMap()).toList(),
    };
  }

  factory Country.fromMap(Map map) {
    final states = (map["states"] as List).map((map) => State.fromMap(map));
    return Country(
      name: map["name"],
      iso2: map["iso2"],
      iso3: map["iso3"],
      states: states.toList(),
    );
  }

  String toJson() => json.encode(toMap());

  static List<Country> fromListMap(List list) {
    return list.map((map) => Country.fromMap(map)).toList();
  }
}

class State {
  final int id;
  final String name;
  State({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory State.fromMap(Map map) {
    return State(
      id: map["id"],
      name: map["name"],
    );
  }
}

class City {
  final int state_id;
  final String name;
  int country_id;
  City({required this.state_id, required this.name, required this.country_id});

  factory City.fromMap(Map map) {
    return City(
      state_id: map["state_id"],
      name: map["name"],
      country_id: map['country_id'],
    );
  }

  static List<City> fromlistMap(List list) {
    return list.map((map) => City.fromMap(map)).toList();
  }
}
