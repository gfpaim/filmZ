import 'package:filmz/constantes.dart';
import 'package:flutter/material.dart';
import 'constantes.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    this.posterPath,
    this.nota,
    this.duracao,
    this.overview,
    this.title,
    this.dataLancamento,
    this.notaIcon,
  });

  final String posterPath;
  final String title;
  final double nota;
  final String overview;
  final DateTime dataLancamento;
  final int duracao;
  final List<Icon> notaIcon;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: DefaultTabController(
          length: 1,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 400.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(widget.title),
                      background: Image.network(
                        IMAGE_URL_ORIGINAL + widget.posterPath,
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: Container(
              margin: EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Data de lançamento
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Título:   " + widget.title,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    // Nota
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Nota: ",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          children: widget.notaIcon,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.nota.toString(),
                          style: TextStyle(fontSize: 25, color: AMARELO),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    // Data de lançamento
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Data de lançamento:   " +
                                widget.dataLancamento.day.toString() +
                                "/" +
                                widget.dataLancamento.month.toString() +
                                "/" +
                                widget.dataLancamento.year.toString(),
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    Text(
                      "Sinopse",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // Sinopse
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.overview,
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
