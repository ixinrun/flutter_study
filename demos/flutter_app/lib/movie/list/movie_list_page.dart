import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/movie/list/movie.dart';

class MovieListPage extends StatefulWidget {

  @override
  _MovieListPageState createState() {
    return new _MovieListPageState();
  }
}

class _MovieListPageState extends State<MovieListPage> {
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    var content;
    if (movies.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView(
        children: [],
      );
    }

    return new Scaffold(
      body: content,
    );
  }

  buildMovieItem() {
    List<Widget> widgets = [];
    for (int i = 0; i < movies.length; i++) {
      Movie movie = movies[i];

      var movieImage = new Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: new Image.network(movie.smallImage, width: 100, height: 120));

      var movieMsg = new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text(
            movie.title,
            textAlign: TextAlign.left,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          new Text('导演' + movie.director),
          new Text('主演' + movie.cast),
          new Text('评分' + movie.average),
          new Text(
            movie.collectCount.toString() + '人看过',
            style: new TextStyle(
              fontSize: 12,
              color: Colors.redAccent,
            ),
          )
        ],
      );

      var movieItem = new GestureDetector(
        onTap: () => navigeteToMovieDetailPage(movie, i),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                movieImage,
                new Expanded(child: movieMsg),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
            new Divider(),
          ],
        ),
      );

      widgets.add(movieItem);
    }

    return widgets;
  }

  navigeteToMovieDetailPage(Movie movie, Object imageTag) {}

  getMovieListData() async {
    var httpClient = new HttpClient();
    var url = 'https://api.douban.com/v2/movie/in_theaters?'
        'apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&'
        'start=0&count=100&client=&udid=';
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.OK) {
      var jsonData = await response.transform(utf8.decoder).join();

      setState(() {
        movies = Movie.decodeData(jsonData.toString());
      });
    }
  }
}
