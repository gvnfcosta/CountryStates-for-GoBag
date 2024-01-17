import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'city_model.dart';
import 'country_model.dart';
import 'country_state_model.dart';
import 'states_cities.dart';

final dir = Directory.current;
final jsonCountryStatesFile =
    File('${dir.path}/assets/go_bag_json/countries+states.json');
final jsonCountryFile = File('${dir.path}/assets/go_bag_json/countries.json');
final jsonStatesCitiesFile =
    File('${dir.path}/assets/go_bag_json/states+cities.json');
final jsonCitiesFile = File('${dir.path}/assets/origin_json/cities.json');

final jsonCountryString = jsonCountryFile.readAsStringSync();
final jsonCountryStatesString = jsonCountryStatesFile.readAsStringSync();
final jsonStatesCitiesString = jsonStatesCitiesFile.readAsStringSync();
final jsonCitiesString = jsonCitiesFile.readAsStringSync();

final countries = Country.fromListMap(jsonDecode(jsonCountryString));
final countriesStates =
    CountryStates.fromListMap(jsonDecode(jsonCountryStatesString));
final statesCities =
    StatesCities.fromListMap(jsonDecode(jsonStatesCitiesString));
final cities = City.fromListMap(jsonDecode(jsonCitiesString));

main() async {
  //convertCountriesStates();
  //convertCountries();
  //convertStatesCities();
  //convertCities();

  // readCountriesStates();
  //readStatesCities();
  // readCities();

  matchCountryCity();
}

matchCountryCity() {
  final state = countries.firstWhere((element) =>
      element.id ==  statesCities.firstWhere((e) => e.country_id (cities.firstWhere((e) => e.name == 'Curitiba' ).cou));

  print(state.name);
}

readCountriesStates() {
  final _myJsonFile = File('${dir.path}/assets/go_bag_json/countries.json');

  final _myJsonString = _myJsonFile.readAsStringSync();

  final _myColection = Country.fromListMap(jsonDecode(_myJsonString));

  print(_myColection[30].name);
}

readStatesCities() {
  final _myJsonFile = File('${dir.path}/assets/go_bag_json/states+cities.json');

  final _myJsonString = _myJsonFile.readAsStringSync();

  final _myColection = StatesCities.fromListMap(jsonDecode(_myJsonString));

  print(_myColection[30].name);
}

readCities() {
  print(cities[30].name);
}

convertCountries() {
  var jsonE = jsonEncode(countries.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/countries.json')
      .writeAsStringSync(jsonE);
}

convertStatesCities() {
  var jsonE = jsonEncode(statesCities.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/states+cities.json')
      .writeAsStringSync(jsonE);
}

convertCountriesStates() {
  var jsonE = jsonEncode(countriesStates.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/countries+states.json')
      .writeAsStringSync(jsonE);
}

convertCities() {
  print(cities[30].name);

  var jsonE = jsonEncode(cities.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/cities.json').writeAsStringSync(jsonE);
}
