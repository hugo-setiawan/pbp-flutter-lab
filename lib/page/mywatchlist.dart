import 'package:flutter/material.dart';
import 'package:counter_7/data/mywatchlist_data.dart';

import 'package:counter_7/page/watchlist_detail.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/mywatchlist_model.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  late Future<List<Watchlist>> savedWatchlist;

  @override
  void initState() {
    super.initState();
    savedWatchlist = fetchMyWatchlist('https://pbp-tugas-hugo.herokuapp.com/mywatchlist/json/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
          future: savedWatchlist,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Belum ada isi Watch List :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return WatchlistDetailPage(
                              watchlist: snapshot.data![index]);
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                // warna berubah sesuai status watched
                                color: snapshot.data![index].fields.watched
                                    ? Colors.green
                                    : Colors.red,
                                blurRadius: 5)
                          ]),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  snapshot.data![index].fields.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: CheckboxListTile(
                                  value: snapshot.data![index].fields.watched,
                                  onChanged: (value) {
                                    setState(() {
                                      snapshot.data![index].fields.watched = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
