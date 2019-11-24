import 'package:flutter/material.dart';
import 'constantes.dart';
import 'details_screen.dart';

class CardHome extends StatefulWidget {
  CardHome(
      {this.titulo,
      this.posterPath,
      this.dataLancamento,
      this.nota,
      this.id,
      this.duracao,
      this.sinopse});

  final String titulo;
  final String posterPath;
  final DateTime dataLancamento;
  final double nota;
  final String sinopse;
  final int id;
  final int duracao;

  @override
  _CardHomeState createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  List<Icon> notaIcon = [];

  @override
  void initState() {
    notaEmIcones();
    super.initState();
  }

  void notaEmIcones() {
    if (widget.nota == 0) {
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 1) {
      notaIcon.add(Icon(Icons.star_half, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 2) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 3) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_half, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 4) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 5) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_half, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 6) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 7) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_half, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 8) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_border, color: AMARELO));
    } else if (widget.nota < 9) {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star_half, color: AMARELO));
    } else {
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
      notaIcon.add(Icon(Icons.star, color: AMARELO));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        title: widget.titulo,
                        duracao: widget.duracao,
                        posterPath: widget.posterPath,
                        nota: widget.nota,
                        dataLancamento: widget.dataLancamento,
                        overview: widget.sinopse,
                        notaIcon: notaIcon,
                      )),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: ROXO,
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 200.0,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                Container(
                  // Poster do filme
                  margin: EdgeInsets.only(right: 20),
                  width: 110.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(IMAGE_URL_500 + widget.posterPath),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Column(
                  // Informações do filme
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // Título
                    Container(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.titulo,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Nota
                    Row(
                      children: <Widget>[
                        Row(
                          children: notaIcon,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.nota.toString(),
                          style: TextStyle(fontSize: 20, color: AMARELO),
                        )
                      ],
                    ),

                    // Data de lançamento
                    Container(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Data de lançamento: " +
                                widget.dataLancamento.day.toString() +
                                "/" +
                                widget.dataLancamento.month.toString() +
                                "/" +
                                widget.dataLancamento.year.toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoriaCard extends StatelessWidget {
  const CategoriaCard({@required this.categoria});

  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
      width: 40.0,
      height: 18,
      child: Center(
        child: Text(
          categoria,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
