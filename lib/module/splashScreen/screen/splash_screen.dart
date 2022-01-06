import 'package:flutter/material.dart';
import 'package:resume_maker/app_route.dart';
import 'package:resume_maker/common/utils/appAssets.dart';
import 'package:resume_maker/module/splashScreen/service/splash_screen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenService{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          AppAssets.brandLogo
        )
      ),
    );
  }

  @override
  void navigateToHomeScreen() {
    Navigator.of(context).pushNamed(AppRoute.homeScreen);
  }

  @override
  void navigateToLoginScreen() {
    Navigator.of(context).pushNamed(AppRoute.loginScreen);
  }
}
