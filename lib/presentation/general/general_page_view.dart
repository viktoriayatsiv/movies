import 'package:flutter/material.dart';
import 'package:movies/data/helper_functions.dart';
import 'package:movies/di/injector.dart';
import 'package:movies/presentation/general/app_bar/app_bar.dart';
import 'package:movies/presentation/general/drawer/drawer.dart';
import 'package:movies/presentation/general/loader/loader.dart';
import 'package:movies/presentation/general/page_view_indicator/page_view_indicator.dart';

class GeneralPageView extends StatefulWidget {
  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  int initialPage = 999;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 1,
      initialPage: initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Injector.of(context).main().getBloc();
    return StreamBuilder(
        stream: bloc.moviesStream(),
        initialData: 0,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('None');
            case ConnectionState.waiting:
              return new Loader();
            default:
              return Scaffold(
                appBar: AppBarWidget(),
                drawer: DrawerWidget(
                    getAllAvailableGanres(snapshot.data).toList(), _controller),
                body: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            initialPage = value;
                          });
                        },
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int index) {
                          return splitMoviesByGenre(snapshot.data)[
                              index % splitMoviesByGenre(snapshot.data).length];
                        },
                      ),
                    )
                  ],
                ),
              );
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
