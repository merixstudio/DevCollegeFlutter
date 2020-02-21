import 'dart:ui';

import 'package:flutter/material.dart';

class GamesResponse {
  final List<Game> results;

  GamesResponse(this.results);

  GamesResponse.fromJson(Map<String, dynamic> json)
      : results =
            (json['results'] as List).map((f) => Game.fromJson(f)).toList();
}

class Game {
  final int id;
  final String name;
  final String backgroundImage;
  final double rating;
  final int ratingTop;
  final int ratingsCount;
  final List<Genre> genres;
  final List<Rate> ratings;

  Game(
    this.id,
    this.name,
    this.backgroundImage,
    this.genres,
    this.rating,
    this.ratingTop,
    this.ratingsCount,
    this.ratings,
  );

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        backgroundImage = json['background_image'],
        rating = json['rating'],
        ratingTop = json['rating_top'],
        ratingsCount = json['ratings_count'],
        genres =
            (json['genres'] as List).map((f) => Genre.fromJson(f)).toList(),
        ratings =
            (json['ratings'] as List).map((f) => Rate.fromJson(f)).toList();

  String cropBackgroundImage(int size) =>
      backgroundImage.replaceAll("/media/", "/media/crop/$size/$size/");

  String get concatGenres => genres.map((genre) => genre.name).join(" \u2022 ");
}

class Genre {
  final int id;
  final String name;

  Genre(this.id, this.name);

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class Rate {
  final int id;
  final String title;
  final int count;

  Rate(this.id, this.title, this.count);

  Rate.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        count = json['count'];

  Color get color {
    switch (title) {
      case "exceptional":
        return Colors.green;
      case "recommended":
        return Colors.blue;
      case "meh":
        return Colors.orange;
      case "skip":
      default:
        return Colors.red;
    }
  }
}
