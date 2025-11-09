// lib/services/covid_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class CovidService {
  // Ejemplo: get latest for a country (usa "country" o lat/lon mapping previo)
  Future<Map<String,dynamic>> fetchCountryStats(String country) async {
    final url = Uri.parse('https://disease.sh/v3/covid-19/countries/$country?strict=true');
    final res = await http.get(url);
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception('Error covid API: ${res.statusCode}');
  }

  // Endpoint para hospitalizaciones no está estandar en todos los países, pero disease.sh ofrece mucha data.
  // Revisa docs para endpoints por país/estado/región. 
}
