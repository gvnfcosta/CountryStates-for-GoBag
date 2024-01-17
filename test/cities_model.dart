// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cities {
  final int id;
  final String name;
  final int state_id;
  final String country_name;

  Cities({
    required this.id,
    required this.name,
    required this.state_id,
    required this.country_name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'stateId': state_id,
      'countryName': country_name,
    };
  }

  static List<Cities> fromListMap(List list) {
    return list.map((map) => Cities.fromMap(map)).toList();
  }

  factory Cities.fromMap(Map<String, dynamic> map) {
    return Cities(
      id: map['id'] as int,
      name: map['name'] as String,
      state_id: map['state_id'] as int,
      country_name: map['country_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cities.fromJson(String source) =>
      Cities.fromMap(json.decode(source) as Map<String, dynamic>);
}
