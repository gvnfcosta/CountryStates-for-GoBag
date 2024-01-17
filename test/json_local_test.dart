import 'dart:convert';
import 'dart:io';

import 'cities_model.dart';
import 'country_state_model.dart';

final dir = Directory.current;
final jsonCountryFile =
    File('${dir.path}/assets/origin_json/countries+states.json');
final jsonCitieFile = File('${dir.path}/assets/origin_json/cities.json');

main() async {
  // convertCountriesStates();
  convertCities();

  // readCountriesStates();
}

readCountriesStates() {
  final jsonCountryString = jsonCountryFile.readAsStringSync();
  final countriesStates =
      CountriesState.fromListMap(jsonDecode(jsonCountryString));

  print(countriesStates[30].name);
}

convertCountriesStates() {
  final jsonCountryString = jsonCountryFile.readAsStringSync();

  final countriesStates =
      CountriesState.fromListMap(jsonDecode(jsonCountryString));

  var jsonE = jsonEncode(countriesStates.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/countries+states.json')
      .writeAsStringSync(jsonE);
}

convertCities() {
  final jsonCityString = jsonCitieFile.readAsStringSync();

  final cities = Cities.fromListMap(jsonDecode(jsonCityString));

  print(cities[30].name);

  var jsonE = jsonEncode(cities.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/cities.json').writeAsStringSync(jsonE);
}
