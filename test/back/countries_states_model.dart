import 'dart:convert';

CountriesStates countriesStatesFromJson(String str) =>
    CountriesStates.fromMap(json.decode(str));

class CountriesStates {
  String name;
  String iso3;
  String iso2;
  String phone_code;
  List<State> states;

  CountriesStates({
    required this.name,
    required this.iso3,
    required this.iso2,
    required this.phone_code,
    required this.states,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'iso3': iso3,
      'iso2': iso2,
      'phone_code': phone_code,
      'states': states.map((x) => x.toMap()).toList(),
    };
  }

  factory CountriesStates.fromMap(Map<String, dynamic> map) {
    return CountriesStates(
      name: map['name'] as String,
      iso3: map['iso3'] as String,
      iso2: map['iso2'] as String,
      phone_code: map['phone_code'] as String,
      states: List<State>.from(
        (map['states'] as List<int>).map<State>(
          (x) => State.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountriesStates.fromJson(String source) =>
      CountriesStates.fromMap(json.decode(source) as Map<String, dynamic>);
}

class State {
  String name;

  State({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory State.fromMap(Map<String, dynamic> map) {
    return State(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory State.fromJson(String source) =>
      State.fromMap(json.decode(source) as Map<String, dynamic>);
}
