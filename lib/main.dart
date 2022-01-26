
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'app_route.dart';

import 'app_route.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> with AppTheme{

  // @override
  // void initState(){
  //   super.initState();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent, // transparent status bar
  //   ));
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,// status bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
    return ScreenUtilInit(
        designSize: const Size(412, 868),
        builder:()=> MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          navigatorKey: AppRoute.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: "CV Maker",
          onGenerateRoute: RouteGenerator.generate,
        )
    );
  }
}
