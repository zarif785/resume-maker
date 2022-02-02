
import 'package:flutter/material.dart';
import 'package:resume_maker/module/register/screen/register_screen.dart';
import 'package:resume_maker/module/resume_Create/screen/resume_create_screen.dart';
import 'package:resume_maker/module/resume_Update/screen/resume_update_screen.dart';

import 'module/home/screen/home_screen.dart';
import 'module/login/screen/login_screen.dart';
import 'module/resume_Create/screen/new_create_screen.dart';
import 'module/splashScreen/screen/splash_screen.dart';

class AppRoute{
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static const String splashScreen = 'splashScreen';
  static const String homeScreen = 'homeScreen';
  static const String loginScreen = 'loginScreen';
  static const String registerScreen = 'registerScreen';
  static const String resumeCreateScreen = 'resumeCreateScreen';
  static const String resumeCreateScreenNew = 'resumeCreateScreenNew';
  static const String resumeUpdateScreen = 'resumeUpdateScreen';
}

mixin RouteGenerator{
  static Route<dynamic> generate(RouteSettings settings){
    return FadeInOutRouteBuilder(builder: (context){
      switch(settings.name){
        case AppRoute.homeScreen : return const HomeScreen();
        case AppRoute.loginScreen : return const LoginScreen();
        case AppRoute.registerScreen : return const RegisterScreen();
        case AppRoute.resumeCreateScreen : return  ResumeCreateScreen();
        case AppRoute.resumeCreateScreenNew : return  ResumeCreateNew();
        case AppRoute.resumeUpdateScreen : return const ResumeUpdateScreen();
        default:
          return  SplashScreen();
          // return const SplashScreen();
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