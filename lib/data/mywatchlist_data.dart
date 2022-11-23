import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:counter_7/model/mywatchlist_model.dart';

Future<List<Watchlist>> fetchMyWatchlist(String urlString) async {
  var url =
      Uri.parse(urlString);

  var resp = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  });

  var data = jsonDecode(utf8.decode(resp.bodyBytes));

  List<Watchlist> listMyWatchlist = [];
  for (var each in data) {
    if (each != null) {
      listMyWatchlist.add(Watchlist.fromJson(each));
    }
  }

  return listMyWatchlist;
}