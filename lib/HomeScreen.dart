import 'package:flutter/material.dart';
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
    return  Scaffold(

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
              icon: Icon(Icons.home),
      label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon:  Icon(Icons.movie),
              label: 'browse'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon:  Icon(Icons.collections_bookmark),
              label: 'watchlist'),


        ],
      ),
      body: tabs[selectedTabIndex],



    );
  }

  var tabs = [homeTap(),searchTap(),browseTab(),watchListTap()];

  int selectedTabIndex = 0;
}
