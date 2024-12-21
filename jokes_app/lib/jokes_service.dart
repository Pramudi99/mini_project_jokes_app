// jokes_service.dart
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class JokeService {
  final Dio _dio = Dio();

  /// Fetch jokes from API or cache if offline
  Future<List<dynamic>> fetchJokes() async {
    try {
      final response = await _dio.get(
        'https://v2.jokeapi.dev/joke/Any?amount=5',
      );

      if (response.statusCode == 200 && response.data != null) {
        final jokes = response.data['jokes'];
        await _cacheJokes(jokes); // Cache jokes for offline use
        return jokes;
      } else {
        throw Exception('Failed to load jokes');
      }
    } catch (e) {
      // If offline, fetch cached jokes
      return await _getCachedJokes();
    }
  }

  /// Cache jokes using shared_preferences
  Future<void> _cacheJokes(List<dynamic> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(jokes);
    await prefs.setString('cached_jokes', jsonString);
  }

  /// Retrieve cached jokes
  Future<List<dynamic>> _getCachedJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('cached_jokes');
    if (jsonString != null) {
      return jsonDecode(jsonString);
    } else {
      throw Exception('No cached jokes available');
    }
  }
}
