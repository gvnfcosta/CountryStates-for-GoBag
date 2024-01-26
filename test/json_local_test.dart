import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'city_model.dart';
import 'country_model.dart';
import 'country_state_model.dart';
import 'states_cities.dart';

final dir = Directory.current;

List<Country> countries = [];
List<City> cities = [];
List<CountryStates> countryStates = [];
List<StatesCities> statesCities = [];

main() async {
  final jsonCountryFile = File('${dir.path}/assets/go_bag_json/countries.json');
  final jsonCountryStatesFile =
      File('${dir.path}/assets/go_bag_json/countries+states.json');
  final jsonCitiesFile = File('${dir.path}/assets/go_bag_json/cities.json');

  final jsonCountryString = jsonCountryFile.readAsStringSync();
  final jsonCountryStatesString = jsonCountryStatesFile.readAsStringSync();
  final jsonCitiesString = jsonCitiesFile.readAsStringSync();

  final countries = Country.fromListMap(jsonDecode(jsonCountryString));

  //convertCities(cities);
  final cities = City.fromListMap(jsonDecode(jsonCitiesString));

  final countriesStates =
      CountryStates.fromListMap(jsonDecode(jsonCountryStatesString));

  // final idFound = cities.where((element) => element.name.contains("Curitiba"));

  // final statesFound = countriesStates
  //     .where((country) => country.states.any((state) => state.id == idFound));

  final myCountry = 'Brasil';

  final country = countries
      .where((element) => element.translations.containsValue(myCountry));

  final countryCode = country.first.numeric_code;

  final countryFound =
      countries.where((element) => element.numeric_code == countryCode);

  countryFound.forEach((element) => print('Meu Pais: ${element.name}'));

  final statesFound = countriesStates
      .where((element) => element.name.contains(countryFound.first.name));

  print('\nEstados do ${myCountry}:');

  final List<String> states = [];

  statesFound.forEach(
      (country) => states.addAll(country.states.map((state) => state.name)));

  states.forEach((element) => print(element));

  final myState = states[15];

  final citiesFound = cities.where((element) => element.name == myState);

  citiesFound.forEach((element) => print(element.name));

  // final myState = statesFound.where((state) => state.);

  // final states = statesFound.

  // final statesFound = countriesStates.where((country) => country.states.any((element) => element.name country.name == countryFound.first.name);
  // element.name ==  statesCities.firstWhere((e) => e.country_id (cities.firstWhere((e) => e.name == 'Curitiba' ).cou));

  // final countrysFound = countriesStates.where((contry) =>
  //     contry.states.any((state) => statesFound.any((e) => state.id == e.id)));

  // idFound.forEach((element) => print(element.state_id));

  // countryFound.forEach((element) => print(element.name));
  // print(statesFound.name);

  // countryFound.forEach(
  //     (element) => element.states.forEach((element) => print(element.name)));

  // statesFound.forEach((element) => print(element.name));
  // countrysFound.forEach((element) => print(element.name));

  // final jsonStatesCitiesFile =
  //     File('${dir.path}/assets/origin_json/states+cities.json');

  // final jsonStatesCitiesString = jsonStatesCitiesFile.readAsStringSync();

  // final statesCities =
  //     StatesCities.fromListMap(jsonDecode(jsonStatesCitiesString));

  // convertCountries(countries);
  //convertCountriesStates(countriesStates);
  //convertStatesCities();
  //convertCities();

  // readCountriesStates();
  //readStatesCities();
  // readCities();

  // matchCountryCity();

// matchCountryCity() {
//   final state = countries.firstWhere((element) =>
//       element.id ==  statesCities.firstWhere((e) => e.country_id (cities.firstWhere((e) => e.name == 'Curitiba' ).cou));

//   print(state.name);
// }
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

convertCountries(List<Country> data) {
  var jsonE = jsonEncode(data.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/countries.json')
      .writeAsStringSync(jsonE);
}

convertStatesCities() {
  var jsonE = jsonEncode(statesCities.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/states+cities.json')
      .writeAsStringSync(jsonE);
}

convertCountriesStates(List<CountryStates> data) {
  var jsonE = jsonEncode(data.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/countries+states.json')
      .writeAsStringSync(jsonE);
}

convertCities(List<City> cities) {
  print(cities[30].name);

  var jsonE = jsonEncode(cities.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/cities.json').writeAsStringSync(jsonE);
}
