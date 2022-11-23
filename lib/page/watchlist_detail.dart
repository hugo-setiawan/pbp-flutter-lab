import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:counter_7/model/mywatchlist_model.dart';

class WatchlistDetailPage extends StatelessWidget {
  const WatchlistDetailPage({super.key, required this.watchlist});

  final Watchlist watchlist;

  @override
  Widget build(BuildContext context) {
    const double largeHeight = 20;
    const double smallHeight = 4;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        drawer: const MyDrawer(),
        body: Container(
          margin: const EdgeInsets.all(7.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: largeHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      watchlist.fields.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(height: largeHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Release Date: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      watchlist.fields.releaseDate.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              const SizedBox(height: smallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Rating: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      "${watchlist.fields.rating.toString()} / 5",
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              const SizedBox(height: smallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Status: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      watchlist.fields.watched ? "watched" : "not watched",
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              const SizedBox(height: smallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text("Review: ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      watchlist.fields.review,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                )
            ],
          ),
        )
      );
  }
}
