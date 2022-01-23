import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/Academics.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';

class ResumeCreateScreen extends StatefulWidget {
  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedAppBar(
        onBack: true,
        title: 'Create Resume',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              Academic(),
              LinearContainer(),
              Experience()


            ],
          ),
        )
      )

    );

  }


}
class LinearContainer extends StatelessWidget with AppTheme{
  const LinearContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.w),
      height: size.s42,
      width: 3.w,
      color: clr.appBlack,
    );
  }
}



