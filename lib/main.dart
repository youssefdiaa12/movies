import 'package:flutter/material.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieDetailsScreen.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieWidget.dart';
import 'package:movies/ui/Movies/MoviesListWidget.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/ui/MovieDetailsScreen/ContentScreen.dart';
import 'package:movies/ui/MovieDetailsScreen/MovieDetails.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var Provider = provider();
  await Provider.login();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (buildContext) => Provider),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
            iconTheme: IconThemeData(color: Colors.white)),
        scaffoldBackgroundColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          enableFeedback: false,
          backgroundColor: Colors.transparent,
          unselectedIconTheme: IconThemeData(size: 32),
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
        RecommendedMovieWidget.routeName: (context) =>  RecommendedMovieWidget(),
        RecommendedMovieDetailScreen.routeName: (context) =>  RecommendedMovieDetailScreen(),


        HomeScreen.routeName: (context) => HomeScreen(),
        MovieDetails.routeName: (context) => MovieDetails(),
        ContentScreen.routeName: (context) => ContentScreen(),
      },
    );
  }
}
