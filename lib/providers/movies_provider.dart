import 'package:flutter/material.dart';
import 'package:flutter_movies_app/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '679bcfaabfe4159f4f33a99d1840f452';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    //print('MoviesProvider init');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jdonData = await _getJsonData('3/movie/now_playing');

    // var url = Uri.https(_baseUrl, '3/movie/now_playing', {
    //   'api_key': _apiKey,
    //   'language': _language,
    //   'page': '1',
    // });

    // // Await the http get response, then decode the json-formatted response.
    // final response = await http.get(url);
    // final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    final nowPlayingResponse = NowPlayingResponse.fromJson(jdonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
    //response.statusCode == 200;
  }

  getPopularMovies() async {
    _popularPage++;
    final jdonData = await _getJsonData('3/movie/popular', _popularPage);

    // var url = Uri.https(_baseUrl, '3/movie/popular', {
    //   'api_key': _apiKey,
    //   'language': _language,
    //   'page': '1',
    // });

    // // Await the http get response, then decode the json-formatted response.
    // final response = await http.get(url);
    // final popularResponse = PopularResponse.fromJson(response.body);
    final popularResponse = PopularResponse.fromJson(jdonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
