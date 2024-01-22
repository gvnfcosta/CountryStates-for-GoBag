class State {
  final int id;
  final String name;
  final String stateCode;
  State({
    required this.id,
    required this.name,
    required this.stateCode,
  });

  factory State.fromMap(Map map) {
    return State(
      id: map["id"],
      name: map["name"],
      stateCode: map["stateCode"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'stateCode': stateCode,
    };
  }
}
