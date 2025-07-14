import 'package:flutter/material.dart';

extension NavigatorExtenstion on NavigatorState {
  Future<void> pushWithModalAnimation({
    required Widget Function(BuildContext context) builder,
  }) async {
    await push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder.call(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(
          begin: const Offset(0, 1),
          end: Offset.zero,
        );

        return SlideTransition(
          position: animation.drive(
            tween.chain(
              CurveTween(curve: Curves.ease),
            ),
          ),
          child: child,
        );
      },
    ));
  }

  Future<void> pushWithoutAnimation({
    required Widget Function(BuildContext context) builder,
  }) async {
    await push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder.call(context),
      transitionDuration: const Duration(microseconds: 0),
      reverseTransitionDuration: const Duration(milliseconds: 0),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
    ));
  }
}
