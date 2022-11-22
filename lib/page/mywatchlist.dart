import 'package:flutter/material.dart';

import 'package:counter_7/widget/drawer.dart';

class MyWatchlistPage extends StatefulWidget {
    const MyWatchlistPage({super.key});

    @override
    State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watch List'),
            ),
            drawer: const MyDrawer(),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                        Text('TODO!'),
                    ],
                ),
            ),
        );
    }
}