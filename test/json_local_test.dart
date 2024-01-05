import 'dart:convert';
import 'dart:io';

import 'country_model.dart';

main() async {
  final dir = Directory.current;
  final jsonCountryFile = File('${dir.path}/assets/countries+states.json');
  final jsonCityFile = File('${dir.path}/assets/cities.json');
  final jsonCountryString = jsonCountryFile.readAsStringSync();
  final jsonCityString = jsonCityFile.readAsStringSync();

  final countriesStates = Country.fromListMap(jsonDecode(jsonCountryString));
  final cities = City.fromlistMap(jsonDecode(jsonCityString));

  // final List<Country> statesFiltered =
  //     countriesStates.where((country) => country. .state_id == state.id).toList();

  countriesStates.forEach((country) {
    print('${country.name}: ${country.states.length}');
    List<String> states = [];
    country.states.forEach((state) {
      states.add('${state.name} - ');
    });
    print('   ${states}');
  });

  int countryLength = countriesStates.length;
  int statesLength = countriesStates.length;

  var country = countriesStates[30];
  var state = country.states[15];

  for (var country in countriesStates) {
    // for (var state in country.states) {

    final List<City> citiesFiltered =
        cities.where((country) => country.state_id == state.id).toList();

    // print('    ${state.name}');
    // for (var cities in citiesFiltered) {
    //   print('        ${cities.name}');
    // }
  }
}



// get do github  *** OK ***
// json  *** OK ***
// salvar o json localmente
// na proxima vc nao baixar o json, usa o local









  // }
  // print(count);
  // print(countries[30].name);
  // print(countries[30].states[15].name);
  // print(countries[30].states[15].id);

  // final goBagCountries = Country. toMap(countries);

  // File('${dir.path}/assets/go_bag_json/countries.json')
  //     .writeAsStringSync(jsonEncode( countries));

  // List<dynamic> countriesData = jsonDecode(jsonFile.readAsStringSync());;

  // final CountriesStates responseModel =
  //     countriesStatesFromJson(countriesData.toString());

  // print(responseModel);

  // print(jsonFile.existsSync());
  // print(jsonFile.lengthSync() / 1024);
  //print(jsonFile.readAsStringSync().substring(0, 1000).replaceAll('\n', ''));

  // File(dir.path + '/assets/countries_B.json')
  //     .writeAsStringSync(jsonEncode({"key": true}));
// }


