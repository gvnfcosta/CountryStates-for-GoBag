import 'dart:convert';
import 'dart:io';

import 'country_model.dart';
// import 'json_http_test.dart';

main() async {
  final dir = Directory.current;
  final jsonCountryFile = File('${dir.path}/assets/countries+states.json');
  final jsonCityFile = File('${dir.path}/assets/cities.json');
  final jsonCountryString = jsonCountryFile.readAsStringSync();
  final jsonCityString = jsonCityFile.readAsStringSync();

  final countriesStates = Country.fromListMap(jsonDecode(jsonCountryString));
  // final countriesStates = Country.toMap(jsonCountryString);
  // final citiesStates = City.fromlistMap(jsonDecode(jsonCityString));

  List<Country> countries = [];
  List<City> cities = [];

  countriesStates.forEach((country) {
    countries.add(
      Country(
        name: country.name,
        iso2: country.iso2,
        iso3: country.iso3,
        states: country.states,
      ),
    );
  });

  var goBagCountries = countriesStates;

  var jsonE = countryStateModelToJson(goBagCountries);

  File('${dir.path}/assets/go_bag_json/countries.json')
      .writeAsStringSync(jsonE);

  // countries.forEach((country) {
  //   print(country.name);
  // });

  // citiesStates.forEach((city) {
  //   cities.add(
  //     City(
  //         state_id: city.state_id,
  //         name: city.name,
  //         country_id: city.country_id),
  //   );
  // });

  // int countryLength = countriesStates.length;
  // int statesLength = countriesStates.length;

  // var country = countriesStates[30];
  // var state = country.states[15];

  //  countries.map((x) => x.toMap()).toList();
  //countryStateModelToJson(countriesStates);

  // final goBag = countryStateModelToJson(goBagCountries);

  // print(jsonCountryString);

  // print(Country.toJson(country));

  // countriesStates
  //     .firstWhere((country) => country.states.firstWhere((state) =>
  //      state.id ==  cities.firstWhere((city) => city.state_id == state.id)))
  //     .states
  //     .forEach((city) {
  //   print(city.name);
  // });

  // for (var country in countriesStates) {
  //   for (var state in country.states) {
  //     final List<City> citiesFiltered =
  //         cities.where((country) => country.state_id == state.id).toList();

  //     print('    ${state.name}');
  //     for (var cities in citiesFiltered) {
  //       print('        ${cities.name}');
  //     }
  //   }
  // }

  // var countries = Country.toJson(countriesStates);
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
