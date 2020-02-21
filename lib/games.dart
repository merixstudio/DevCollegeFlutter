import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GameItem(
            title: "Game #$index",
            subtitle: "Subtitle",
            imageUrl: "https://picsum.photos/seed/game-$index/60/60",
          );
        },
        itemCount: 300,
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
