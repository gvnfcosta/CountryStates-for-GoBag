class State {
  final int id;
  final String name;
  final String state_code;
  State({
    required this.id,
    required this.name,
    required this.state_code,
  });

  factory State.fromMap(Map map) {
    return State(
      id: map["id"],
      name: map["name"],
      state_code: map["state_code"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'stateCode': state_code,
    };
  }
}
