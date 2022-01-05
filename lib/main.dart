
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 868),
        builder:()=> MaterialApp(
          navigatorKey: AppRoute.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: "CV Maker",
          onGenerateRoute: RouteGenerator.generate,
        )
    );
  }
}
