import 'package:http/http.dart' as http;

import 'cities_model.dart';
import 'country_state_model.dart';

List<Country> countries = [];
List<State> states = [];
List<CitiesModel> cities = [];

CountryStateModel countryModel = CountryStateModel(data: []);
CitiesModel citiesModel = CitiesModel(data: []);

main() async {
  countryModel = await getCountriesStates();

  // get do github
  // json
  // salvar o json localmente
  // na proxima vc nao baixar o json, usa o local

  for (var country in countryModel.data) {
    countries.add(country);
    states.addAll(country.states);
    print('COUNTRY: ${country.name}');
    for (var state in country.states) {
      print('   STATE: ${state.name}');
      citiesModel = await getCities(country.name, state.name);
      print('      CIDADES: ${citiesModel.data}');
      cities.add(citiesModel);
    }
  }

  countries
      .firstWhere((element) => element.name == 'Brazil')
      .states
      .forEach((element) {
    print(element.name);
  });

  // for (var element in citiesModel.data) {
  //   cities.addAll(element);
  // }

  print(citiesModel.data);

  // cities.forEach(
  //   (element) {
  //     print(element.data);
  //   },
  // );

  // countries.forEach(
  //   (element) {
  //     print(element.name);
  //   },
  // );

  // states.forEach(
  //   (element) {
  //     print(element.name);
  //   },
  // );
}

getCountriesStates() async {
  const countriesStateURL =
      'https://countriesnow.space/api/v0.1/countries/states';

  var url = Uri.parse(countriesStateURL);
  var response = await http.get(url);

  final CountryStateModel responseModel =
      countryStateModelFromJson(response.body);
  return responseModel;
}

getCities(String country, String state) async {
  const cityURL =
      'https://countriesnow.space/api/v0.1/countries/state/cities/q?country';

  var url = Uri.parse("$cityURL=$country&state=$state");
  var response = await http.get(url);

  final CitiesModel responseModel = citiesModelFromJson(response.body);
  return responseModel;
}
