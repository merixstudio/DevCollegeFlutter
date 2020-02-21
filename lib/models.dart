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

  Game(
    this.id,
    this.name,
    this.backgroundImage,
    this.genres,
    this.rating,
    this.ratingTop,
    this.ratingsCount,
  );

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        backgroundImage = json['background_image'],
        rating = json['rating'],
        ratingTop = json['rating_top'],
        ratingsCount = json['ratings_count'],
        genres = (json['genres'] as List).map((f) => Genre.fromJson(f)).toList();

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
