import 'package:flutter/material.dart';
import 'package:movies/di/injector.dart';
import 'general/general_page_view.dart';
import 'general/app_bar/app_bar.dart';

void main() {
  var injector = Injector(child: MoviesApp());
  injector.init();
  runApp(injector);
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
          accentColor: Colors.yellow,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
            headline3: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.w600,
                color: Colors.yellow),
            headline6: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                color: Colors.yellow.shade100),
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget(),
        body: GeneralPageView(),
      ),
    );
  }
}
