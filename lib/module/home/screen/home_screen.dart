import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';
import 'package:resume_maker/module/home/service/home_screen_service.dart';
import 'package:resume_maker/module/resume_display/screen/resume_display_screen.dart';

import '../../../app_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AppTheme,HomeScreenService{



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: RoundedAppBar(title: "Resume Builder", onBack: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top:size.s24,left:size.s24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome,',style: TextStyle(
                          fontSize: size.textLarge,fontWeight: FontWeight.w600
                        ),),
                        Text(App.currentSession.name,style: TextStyle(
                            fontSize: size.textXLarge,fontWeight: FontWeight.w800
                        ),),
                      ],
                    ),),
                  SizedBox(height: 100.h),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("What would you like to do?",
                          style:TextStyle(
                              fontSize: size.textXLarge,fontWeight: FontWeight.w600
                          ),),
                        SizedBox(height: size.s16),
                        ElevatedButton(onPressed: onUpdate, child: Text("Update Resume"),),
                        SizedBox(height: size.s8),
                        ElevatedButton(onPressed: onCreate, child: Text("Create Resume"),),
                        SizedBox(height: size.s8),
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ResumeDisplay()),
                          );
                        }, child: Text("Display Resume"),)
                      ],
                    ),
                  )
              ],
            ),


      ),
    );
  }

  @override
  void navigateToCreateResumeScreen() {
    Navigator.of(context).pushNamed(AppRoute.resumeCreateScreenNew);
  }

  @override
  void navigateToUpdateResumeScreen() {
    Navigator.of(context).pushNamed(AppRoute.resumeUpdateScreen);
  }
}
