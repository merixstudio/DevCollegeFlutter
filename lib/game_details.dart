import 'package:flutter/material.dart';
import 'package:flutter_workshop_1/models.dart';

class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(260.0),
        child: AppBar(
          flexibleSpace: Stack(
            children: [
              SizedBox.expand(
                child: Image.network(
                  game.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black45, Colors.transparent],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0, top: 48.0),
                    child: Text(
                      game.name,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tag(
                    iconData: Icons.star,
                    label: "Rate",
                    value: game.rating.toString(),
                  ),
                  Tag(
                    iconData: Icons.face,
                    label: "Count",
                    value: game.ratingsCount.toString(),
                  ),
                  Tag(
                    iconData: Icons.card_giftcard,
                    label: "Rating top",
                    value: "#${game.ratingTop}",
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  ...game.ratings.map(
                    (rate) => RatingTag(
                      color: rate.color,
                      title: rate.title,
                      number: rate.count,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String value;

  const Tag({Key key, this.iconData, this.label, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            iconData,
            size: 30.0,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.subtitle,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }
}

class RatingTag extends StatelessWidget {
  final Color color;
  final String title;
  final int number;

  const RatingTag({Key key, this.color, this.title, this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10.0),
        Text(title),
        SizedBox(width: 6.0),
        Opacity(opacity: 0.3, child: Text("($number)")),
      ],
    );
  }
}
