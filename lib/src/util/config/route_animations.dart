import 'dart:io';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class HybridRouteAnimations extends PageRoute {
  HybridRouteAnimations(
      this.page, {
        this.type,
        super.settings,
      });

  final Widget page;
  final SharedAxisTransitionType? type;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return page;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Platform.isIOS
        ? const CupertinoPageTransitionsBuilder().buildTransitions(
        this, context, animation, secondaryAnimation, child)
        : SharedAxisPageTransitionsBuilder(transitionType: type ?? SharedAxisTransitionType.horizontal)
        .buildTransitions(
        this, context, animation, secondaryAnimation, child);
  }
}
