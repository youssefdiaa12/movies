import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/ui/BrowseTap/browseTab.dart';
import 'package:movies/ui/HomeTap/homeTap.dart';
import 'package:movies/ui/SearchTap/searchTap.dart';
import 'package:movies/ui/WatchListTap/watchListTap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
            height: 50,
            width: 200,
            child: Lottie.network(
                "https://lottie.host/19e350a3-71fb-41e6-af52-a69cac311867/rvj70SfJEh.json")),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.home),
              label: 'Home' ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.movie),
              label: 'Browse'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.collections_bookmark),
              label: 'Watchlist'),
        ],
      ),
      body: tabs[selectedTabIndex],
    );
  }

  var tabs = [const homeTap(), searchTap(), browseTab(), const watchListTap()];

  int selectedTabIndex = 0;
}
