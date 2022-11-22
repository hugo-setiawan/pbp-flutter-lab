import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:counter_7/model/mywatchlist_model.dart';

class WatchlistDetailPage extends StatelessWidget {
  const WatchlistDetailPage({super.key, required this.watchlist});

  final Watchlist watchlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        drawer: const MyDrawer(),
        // TODO tidy up body n styling
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
        ));
  }
}
