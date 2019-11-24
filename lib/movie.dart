import 'dart:convert';
import 'dart:ffi';

import 'package:filmz/movie.dart';
import 'package:flutter/foundation.dart';
import 'constantes.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchPopularMovies(http.Client client) async {
  final response = await client.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=92617104f2646d905240d1f828861df6&language=pt-BR');

  var body = json.decode(response.body);

  //return parseMovies(response.body);
  //return compute(parseMovies, response.body);
  return compute(_computeMovies, body['results']);
}

List<Movie> _computeMovies(dynamic body) =>
    List<Movie>.from(body.map((movie) => Movie.fromJson(movie)));

List<Movie> parseMovies(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}

class Movie {
  String titulo;
  double nota;
  List<int> idGeneros;
  int id;
  String sinopse;
  String posterPath;
  DateTime dataLancamento;
  int duracao;

  Movie({
    this.titulo,
    this.nota,
    this.idGeneros,
    this.id,
    this.sinopse,
    this.posterPath,
    this.dataLancamento,
    this.duracao,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      titulo: json['title'],
      nota: json['vote_average'].toDouble(),
      idGeneros: json['genre_ids'].cast<int>(),
      id: json['id'],
      sinopse: json['overview'],
      posterPath: json['poster_path'],
      dataLancamento: DateTime.parse(json['release_date']),
      duracao: json['runtime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.titulo;
    data['vote_average'] = this.nota;
    data['genre_ids'] = this.idGeneros;
    data['id'] = this.id;
    data['overview'] = this.sinopse;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.dataLancamento;
    data['runtime'] = this.duracao;

    return data;
  }
}
