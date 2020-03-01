import 'package:flutter/material.dart';
import 'package:movies/di/injector.dart';
import '../../pages/page_0.dart';
import '../../pages/page_1.dart';

class GeneralPageView extends StatefulWidget {
  @override
  _GeneralPageViewState createState() => _GeneralPageViewState();
}

class _GeneralPageViewState extends State<GeneralPageView> {
  PageController _controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    var bloc = Injector.of(context).main().getBloc();
    return PageView(
      controller: _controller,
      children: [
        PageWidget0(),
        PageWidget1(),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}