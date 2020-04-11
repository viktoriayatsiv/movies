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
          primarySwatch: Colors.deepPurple, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWidget(),
        body: GeneralPageView(),
      ),
    );
  }
}
