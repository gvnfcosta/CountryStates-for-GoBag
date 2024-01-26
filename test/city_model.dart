class City {
  final int id;
  final int state_id;
  final String name;

  City({
    required this.id,
    required this.state_id,
    required this.name,
  });

  static List<City> fromListMap(List list) {
    return list.map((map) => City.fromMap(map)).toList();
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] as int,
      state_id: map['state_id'] as int,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'state_id': state_id,
      'name': name,
    };
  }
}
