import 'dart:convert';
import 'dart:io';

import 'country_state_model.dart';

main() async {
  final dir = Directory.current;
  final jsonCountryFile =
      File('${dir.path}/assets/origin/countries+states.json');
  final jsonCountryString = jsonCountryFile.readAsStringSync();
  // final jsonCityFile = File('${dir.path}/assets/cities.json');
  // final jsonCityString = jsonCityFile.readAsStringSync();

  final countriesStates =
      CountriesState.fromListMap(jsonDecode(jsonCountryString));

  List<CountriesState> countries = [];
  // List<City> cities = [];

  var jsonE = jsonEncode(countriesStates.map((e) => e.toMap()).toList());

  File('${dir.path}/assets/go_bag_json/countries+states.json')
      .writeAsStringSync(jsonE);
}
