class Country {
  final int id;
  final String name;
  final String iso2;
  final String iso3;
  final String numeric_code;
  final String phone_code;
  final Map<String, dynamic> translations;

  Country({
    required this.id,
    required this.name,
    required this.iso2,
    required this.iso3,
    required this.numeric_code,
    required this.phone_code,
    required this.translations,
  });

  static List<Country> fromListMap(List list) {
    return list.map((map) => Country.fromMap(map)).toList();
  }

  factory Country.fromMap(Map map) {
    return Country(
      id: map['id'] as int,
      name: map['name'] as String,
      iso2: map['iso2'] as String,
      iso3: map['iso3'] as String,
      numeric_code: map['numeric_code'] as String,
      phone_code: map['phone_code'] as String,
      translations: Map<String, dynamic>.from(map['translations']),
    );
  }

  static List<Map> toListMap(List<Country> countries) {
    return countries.map((country) => country.toMap()).toList();
  }

  factory Country.fromJson(Map<String, dynamic> map) => Country(
        id: map['id'] as int,
        name: map['name'] as String,
        iso2: map['iso2'] as String,
        iso3: map['iso3'] as String,
        phone_code: map['phone_code'] as String,
        numeric_code: map['numeric_code'] as String,
        translations: Map<String, dynamic>.from(map['translations']),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'iso2': iso2,
      'iso3': iso3,
      'numeric_code': numeric_code,
      'phone_code': phone_code,
      'translations': translations,
    };
  }
}
