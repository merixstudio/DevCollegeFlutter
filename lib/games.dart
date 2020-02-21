import 'package:flutter/material.dart';
import 'package:flutter_workshop_1/games_view_model.dart';
import 'package:flutter_workshop_1/models.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Future<List<Game>> futureGames;
  GamesViewModel _gamesViewModel;

  @override
  void initState() {
    super.initState();
    _gamesViewModel = GamesViewModel();
    futureGames = _gamesViewModel.fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Game>>(
        future: futureGames,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return GameItem(
                  title: snapshot.data[index].name,
                  subtitle: snapshot.data[index].concatGenres,
                  imageUrl: snapshot.data[index].cropBackgroundImage(96),
                );
              },
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Whoops! Try again later.",
                style: Theme.of(context).textTheme.title,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class GameItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const GameItem({Key key, this.imageUrl, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Row(
          children: [
            buildCover(),
            buildTitles(context),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  buildCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        imageUrl,
        width: 60.0,
        height: 60.0,
        fit: BoxFit.cover,
      ),
    );
  }

  buildTitles(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.title),
            Text(subtitle, style: Theme.of(context).textTheme.subtitle),
          ],
        ),
      ),
    );
  }
}
