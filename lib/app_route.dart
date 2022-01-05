import 'package:cv_maker/module/home/screen/home_screen.dart';
import 'package:cv_maker/module/login/screen/login_screen.dart';
import 'package:cv_maker/module/splashScreen/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute{
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static const String splashScreen = 'splashScreen';
  static const String homeScreen = 'homeScreen';
  static const String loginScreen = 'loginScreen';
}

mixin RouteGenerator{
  static Route<dynamic> generate(RouteSettings settings){
    return FadeInOutRouteBuilder(builder: (context){
      switch(settings.name){
        case AppRoute.homeScreen : return const HomeScreen();
        case AppRoute.loginScreen : return const LoginScreen();
        default:
          return const SplashScreen();
      }
    });
  }
}

class FadeInOutRouteBuilder extends PageRouteBuilder {
  final WidgetBuilder builder;
  FadeInOutRouteBuilder({required this.builder}) : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return builder(context);
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return  FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.50,
                1.00,
                curve: Curves.linear,
              ),
            ),
          ),
          child: child,
        );
      }
  );
}