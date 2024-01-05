import 'dart:convert';

import 'package:http/http.dart' as http;
import 'repository_model.dart';

class ApiService {
  static const baseUrl =
      "api.github.com/dr5hn/countries-states-cities-database/blob/cb7c3ac68b5d974da84eb2b42b8c1b84106df33d/";

  static Future<dynamic> getRepositories() async {
    var url = Uri.https(baseUrl, 'countries.json');
    var response = await http.get(url);

    var repositories = (json.decode(response.body))
        .map((item) => RepositoryModel.fromJson(item))
        .toList();

    return repositories;
  }
}
