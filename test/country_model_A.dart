// // String countryStateModelToJson(Country data) => json.encode(data.toJson());

// class Country {
//   final String name;
//   final String iso2;
//   final String iso3;
//   final Map translattions;
//   final List<State> states;

//   Country({
//     required this.name,
//     required this.iso2,
//     required this.iso3,
//     required this.translattions,
//     required this.states,
//   });

//   factory Country.fromMap(Map map) {
//     return Country(
//       name: map['name'] as String,
//       iso2: map['iso2'] as String,
//       iso3: map['iso3'] as String,
//       translattions: Map.from((map['translattions' as Map])),
//       states: (map["states"] as List).map((map) => State.fromMap(map)).toList(),
//     );
//   }

//   static List<Country> fromListMap(List list) {
//     return list.map((map) => Country.fromMap(map)).toList();
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'iso2': iso2,
//       'iso3': iso3,
//       'translattions': translattions,
//       'states': states.map((x) => x.toMap()).toList(),
//     };
//   }

//   static List<Map> toListMap(List<Country> countries) {
//     final countriesMap = <Map>[];

//     for (var country in countries) {
//       countriesMap.add(country.toMap());
//     }
//     return countriesMap;
//   }


//   factory Country.fromJson(Map<String, dynamic> map) => Country(
//         name: map["name"] as String,
//         iso2: map["iso2"] as String,
//         iso3: map["iso3"] as String,
//         states:
//             (map["states"] as List).map((map) => State.fromMap(map)).toList(),
//       );






      
//   // Map<String, dynamic> toJson() => {
//   //       "name": name,
//   //       "iso3": iso3,
//   //       "iso2": iso2,
//   //       "states": List<dynamic>.from(states.map((x) => x.toJson())),
//   //     };

//   // factory Country.fromJson(String source) =>
//   //     Country.fromMap(json.decode(source) as Map<String, dynamic>);

//   // Map<String, dynamic> toJson() => {
//   //       "name": name,
//   //       "iso3": iso3,
//   //       "iso2": iso2,
//   //       "states": List<dynamic>.from(states.map((x) => x.toJson())),
//   //     };

// //   static String toJson(String source) => json.encode(toMapList(source));
// }

// class State {
//   final int id;
//   final String name;
//   State({
//     required this.id,
//     required this.name,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//     };
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };

//   factory State.fromMap(Map map) {
//     return State(
//       id: map["id"],
//       name: map["name"],
//     );
//   }
// }

// class City {
//   final int state_id;
//   final String name;
//   int country_id;
//   City({required this.state_id, required this.name, required this.country_id});

//   factory City.fromMap(Map map) {
//     return City(
//       state_id: map["state_id"],
//       name: map["name"],
//       country_id: map['country_id'],
//     );
//   }

//   List<City> fromlistMap(List list) {
//     return list.map((map) => City.fromMap(map)).toList();
//   }
// }

// // extension ListCountry on List<Country> {
// //   List<Map> toListMap() {
// //     final countriesMap = <Map>[];

// //     for (var country in this) {
// //       countriesMap.add(country.toMap());
// //     }
// //     return countriesMap;
// //   }
// // }



//   // factory Country.fromJson(String json) {
//   //   return Country.fromMap(jsonDecode(json));
//   // }

//   // Map<String, dynamic> toMap() {
//   //   return <String, dynamic>{
//   //     'name': name,
//   //     'iso3': iso3,
//   //     'iso2': iso2,
//   //     'states': states.map((x) => x.toMap()).toList(),
//   //   };
//   // }

//   // factory Country.fromMap(Map map) {
//   //   final states = (map["states"] as List).map((map) => State.fromMap(map));
//   //   return Country(
//   //     name: map["name"],
//   //     iso2: map["iso2"],
//   //     iso3: map["iso3"],
//   //     states: states.toList(),
//   //   );
//   // }

//   // String toJson() => json.encode(toMap());

//   // static List<Country> fromListMap(List list) {
//   //   return list.map((map) => Country.fromMap(map)).toList();
//   // }