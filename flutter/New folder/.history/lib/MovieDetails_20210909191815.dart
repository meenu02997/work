import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meenu_mega_test/bookTicket.dart';

class MovieDetails extends StatefulWidget {
  String posterpath;
  String original_title;
  // ignore: non_constant_identifier_names
  String release_date;
  String overview;
  MovieDetails(
      {this.posterpath, this.original_title, this.release_date, this.overview});

  //final String title;
  @override
  _MovieDetailsState createState() => _MovieDetailsState(
      posterpath: posterpath,
      original_title: original_title,
      overview: overview,
      release_date: release_date);
}

class _MovieDetailsState extends State<MovieDetails> {
  String posterpath;
  String original_title;
  String release_date;
  String overview;
  _MovieDetailsState(
      {this.posterpath, this.original_title, this.overview, this.release_date});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "${original_title}",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.amber,
              toolbarHeight: 80.0,
            ),
            bottomNavigationBar: SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BookTicket()));
                  },
                  color: HexColor("#ffc905"),
                  textColor: Colors.white,
                  child: Text(
                    'Book Ticket',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 50*SizeConfig,
                        height: MediaQuery.of(context).size.height * 0.38,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                        ),
                      ),
                      Positioned(
                          height: MediaQuery.of(context).size.height * 0.43,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            //height: 50*SizeConfig,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.network(
                              '${"https://image.tmdb.org/t/p/w500/"}' +
                                  posterpath,
                              fit: BoxFit.fill,
                            ),
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.44,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.36,
                          decoration: BoxDecoration(
                            color: Colors.lime,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                original_title,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                'release date:' + release_date,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'OverView:   ' + overview,
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black54)),
                                //TextSpan(text: "   " + m.results[2].originalTitle, style: TextStyle(color: Colors.black))
                              ])),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 7.0,
      width: 7.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
