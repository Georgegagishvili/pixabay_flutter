import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/src/util/exports.dart';

extension Navigation on BuildContext {
  void pop() => Navigator.of(this).pop();

  void popUntilRoot() => Navigator.of(this).popUntil((route) => route.isFirst);

  Future<dynamic> push(
    Widget page, {
    SharedAxisTransitionType? animation,
    bool rootNavigator = false,
  }) =>
      Navigator.of(this, rootNavigator: rootNavigator)
          .push(
            HybridRouteAnimations(
              page,
              type: animation,
              settings:
                  RouteSettings(name: '/${page.toString().toLowerCase()}'),
            ),
          )
          .then((v) => v);

  Future<dynamic> pushReplacement(
    Widget page, {
    SharedAxisTransitionType? animation,
    bool rootNavigator = false,
  }) =>
      Navigator.of(this, rootNavigator: rootNavigator)
          .pushReplacement(
            HybridRouteAnimations(
              page,
              type: animation,
              settings:
                  RouteSettings(name: '/${page.toString().toLowerCase()}'),
            ),
          )
          .then((v) => v);

  void pushAndRemoveUntil(
    Widget page, {
    SharedAxisTransitionType? animation,
    bool rootNavigator = false,
  }) =>
      Navigator.of(this, rootNavigator: rootNavigator).pushAndRemoveUntil(
        HybridRouteAnimations(
          page,
          type: animation,
          settings: RouteSettings(name: '/${page.toString().toLowerCase()}'),
        ),
        (route) => false,
      );
}
