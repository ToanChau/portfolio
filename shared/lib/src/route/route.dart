import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();

  static const home = '/';
  static const homeAboutUs = 'about-us';
  static const homeEcosystem = 'ecosystem';
  static const homeSolution = 'solution';
  static const homeCoreValue = 'core-value';

  static const aboutUs = '/about-us';
  static const aboutUsStory = 'story';
  static const aboutUsLeader = 'leader';

  static const ecosystem = '/ecosystem';
  static const ecosystemAilogy = 'ailogy';
  static const ecosystemFinister = 'finister';
  static const ecosystemChargeChill = 'chargechill';

  static const contact = '/contact';
  static const contactPartnershipInquiry = 'partnership-inquiry';
  static const contactCompanyInfo = 'company-info';
}

abstract class PageRouteDelegate<P1 extends PageParams> {
  P1 getParams(Uri uri);

  Widget getPage(P1 params);

  String get route;

  GoRoute toRoute() => GoRoute(
        path: route,
        pageBuilder: (context, state) {
          final widget = getPage(getParams(state.uri));
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: widget,
          );
        },
      );
}

abstract class PageParams {}

class PageNoParams extends PageParams {}

class QueryParams extends PageParams {
  final String? id;

  QueryParams({this.id});
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page, super.settings, super.barrierLabel})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
