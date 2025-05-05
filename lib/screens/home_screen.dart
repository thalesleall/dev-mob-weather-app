import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherInfo = '';

  Future<void> _fetchWeather() async {
    final city = _cityController.text.trim();
    if (city.isEmpty) return;
    final data = await WeatherService.getWeather(city);
    setState(() {
      _weatherInfo = data ?? 'Erro ao buscar clima';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Digite o nome da cidade',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _fetchWeather, child: const Text('Buscar Clima')),
            const SizedBox(height: 20),
            Text(
              _weatherInfo,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
