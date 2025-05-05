import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = 'a0facc3b9b88810e9c3b0d837ddcc63a';

  static Future<String?> getWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&lang=pt&units=metric';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final temp = data['main']['temp'];
        final desc = data['weather'][0]['description'];
        return 'Temperatura: $temp°C\nDescrição: $desc';
      } else {
        return 'Erro: ${response.statusCode}';
      }
    } catch (e) {
      return 'Erro de rede';
    }
  }
}
