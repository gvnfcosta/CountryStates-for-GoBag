import 'package:http/http.dart' as http;

Future<String> gitCities() async {
  final url =
      'https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/cities.json';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = response.body;
      return jsonData;
    } else {
      return 'Falha ao carregar o JSON. Status code: ${response.statusCode}';
    }
  } catch (e) {
    return 'Erro durante a solicitação: $e';
  }
}
