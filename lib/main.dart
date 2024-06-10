import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/common/bloc_observer.dart';
import 'package:movies/di/di.dart';
import 'package:movies/splash.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieDetailsScreen.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieWidget.dart';
import 'package:movies/ui/Movies/MoviesListWidget.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
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
    return ResponsiveSizer(
      builder: (BuildContext , Orientation , ScreenType ) {
        return           MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedLabelStyle: TextStyle(
                  fontFamily: "a"
              ),
              selectedLabelStyle: TextStyle(
                  fontFamily: "a"
              ),
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.white,
              enableFeedback: false,
              backgroundColor: Colors.transparent,
              unselectedIconTheme: IconThemeData(size: 32),
              selectedIconTheme: IconThemeData(size: 32),
              selectedItemColor: Color(0xffFFB224),

            ),
            primaryColor: const Color(0xff1A1A1A),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black,
              secondary: const Color(0xffFFB224),
            ),
            useMaterial3: true,
          ),
          initialRoute: splash.routeName,
          routes: {
            splash.routeName :(context) => const splash(),
            HomeScreen.routeName: (context) =>  HomeScreen(),
            MoviesListWidget.routeName: (context) =>  MoviesListWidget(),
            RecommendedMovieWidget.routeName: (context) =>  RecommendedMovieWidget(),
            RecommendedMovieDetailScreen.routeName: (context) =>  RecommendedMovieDetailScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
);
      },
    );
  }
}