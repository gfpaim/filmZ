import 'package:filmz/movie.dart';
import 'package:flutter/material.dart';
import 'constantes.dart';
import 'movie.dart';
import 'package:http/http.dart' as http;
import 'card_home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Movie>>(
        future: fetchPopularMovies(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? HomeBody(
                  filmes: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final List<Movie> filmes;

  HomeBody({this.filmes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filmes.length,
      itemBuilder: (context, index) {
        return CardHome(
          dataLancamento: filmes[index].dataLancamento,
          nota: filmes[index].nota,
          posterPath: filmes[index].posterPath,
          titulo: filmes[index].titulo,
          sinopse: filmes[index].sinopse,
          id: filmes[index].id,
          duracao: filmes[index].duracao,
        );
      },
    );
  }
}
