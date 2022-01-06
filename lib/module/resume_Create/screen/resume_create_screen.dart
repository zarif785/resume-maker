import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';

class ResumeCreateScreen extends StatefulWidget {
  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedAppBar(
        title: 'Create Resume',
        child: Text("hello"),
      )

    );

  }


}