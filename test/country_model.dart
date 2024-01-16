class Country {
  final String name;
  final String iso2;
  final String iso3;
  final Map<String, dynamic> translations; // Correção aqui
  final List<State> states;

  Country({
    required this.name,
    required this.iso2,
    required this.iso3,
    required this.translations,
    required this.states,
  });

  factory Country.fromMap(Map map) {
    return Country(
      name: map['name'] as String,
      iso2: map['iso2'] as String,
      iso3: map['iso3'] as String,
      translations:
          Map<String, dynamic>.from(map['translations']), // Correção aqui
      states: (map['states'] as List).map((map) => State.fromMap(map)).toList(),
    );
  }

  static List<Country> fromListMap(List list) {
    return list.map((map) => Country.fromMap(map)).toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'iso2': iso2,
      'iso3': iso3,
      'translations': translations,
      'states': states.map((state) => state.toMap()).toList(),
    };
  }

  static List<Map> toListMap(List<Country> countries) {
    return countries.map((country) => country.toMap()).toList();
  }

  factory Country.fromJson(Map<String, dynamic> map) => Country(
        name: map['name'] as String,
        iso2: map['iso2'] as String,
        iso3: map['iso3'] as String,
        translations:
            Map<String, dynamic>.from(map['translations']), // Correção aqui
        states: (map['states'] as List)
            .map((stateMap) => State.fromMap(stateMap))
            .toList(),
      );
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory State.fromMap(Map map) {
    return State(
      id: map["id"],
      name: map["name"],
    );
  }
}
