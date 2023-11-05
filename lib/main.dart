import 'package:flutter/material.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/ui/Movies/MoviesListWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 32),
          selectedItemColor: Color(0xffFFB224),
        ),

        primaryColor: Color(0xff1A1A1A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          secondary: Color(0xffFFB224),
        ),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>  HomeScreen(),
        MoviesListWidget.routeName: (context) =>  MoviesListWidget(),

      },
    );
  }
}
