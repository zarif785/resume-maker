import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/Academics.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';

import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/project.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/reference.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/user_image.dart';

class ResumeCreateScreen extends StatefulWidget {
  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,// status bar color
    ));
    return RoundedAppBar(
      onBack: true,
      title: 'Create Resume',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearContainer(),
            FormContent(icon: Icons.person, title: "Account"),
            LinearContainer(),
            FormContent(icon: Icons.school, title: "Academic"),
            LinearContainer(),
            FormContent(icon: Icons.work, title: "Experience"),
            LinearContainer(),
            FormContent(icon: Icons.assignment, title: "Project"),
            LinearContainer(),
            FormContent(icon: Icons.connect_without_contact, title: "Reference"),
            LinearContainer(),
            FormContent(icon: Icons.camera, title: "Image"),
            LinearContainer(),
            FormContent(icon: Icons.gesture, title: "Signature"),

          ],
        ),
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
      height: size.s64,
      width: 3.w,
      color: clr.appBlack,
    );
  }
}

class FormContent extends StatefulWidget {
  final IconData icon;
  final String title;
  const FormContent({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  _FormContentState createState() => _FormContentState();
}

class _FormContentState extends State<FormContent>with AppTheme {

  bool _isShowing= false;
  void _toggleViewer() {
    setState(() {
      _isShowing = !_isShowing;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleViewer,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: clr.appBlack,
                    borderRadius: BorderRadius.circular(50.r),

                  ),
                  child:Icon(widget.icon,color: Colors.white,)
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: size.s12),
                    padding: EdgeInsets.symmetric(vertical: size.s12,),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          // color:widget.service.currentChapterId == widget.chapter.id ?Colors.orange:Colors.black.withOpacity(.7),
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.s8),
                  child: Icon(_isShowing?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, size: 26, color: Colors.grey.withOpacity(.9),),
                ),
              ],

            ),
          ),
          // _isShowing?Container(
          //   child: Column(
          //     children: [
          //       Academics()
          //       ]
          //   ),
          // ):Offstage(),
          UserImage(),
          Container(
            height: 1.2,
            width: MediaQuery.of(context).size.width -100,
            color: Colors.grey.withOpacity(.25),
          ),

          // Divider(thickness: 3,indent: 30,endIndent: 30,)
        ],
      ),
    );
  }
}



