import 'package:flutter/material.dart';
import 'package:movies/di/general_page_injector.dart';

class Injector extends InheritedWidget {

  GeneralPageInjector _mainPageInjector;

  Injector({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  void init() {
    _mainPageInjector = GeneralPageInjector();
    _mainPageInjector.init();
  }

  static Injector of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Injector>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  GeneralPageInjector main() {
    return _mainPageInjector;
  }
}
