import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_movies_app/providers/movies_provider.dart';
import 'package:flutter_movies_app/search/search_delegate.dart';
import 'package:flutter_movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en Cartelera'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales:
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              // Slider de películas:
              MovieSlider(
                movies: moviesProvider.popularMovies,
                titleMovieSlider: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
