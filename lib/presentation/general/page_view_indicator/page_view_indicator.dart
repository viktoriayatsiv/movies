import 'package:flutter/material.dart';
import 'package:movies/data/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewIndicatorWidget extends StatelessWidget {
  final int count;
  final PageController controller;

  PageViewIndicatorWidget(this.count, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: moviesDefaultPadding / 2,
      ),
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: SwapEffect(
            dotColor: Colors.yellow.withOpacity(0.2),
            activeDotColor: Colors.yellow),
      ),
    );
  }
}
