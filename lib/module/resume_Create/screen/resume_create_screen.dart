import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';

import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';
import 'package:resume_maker/common/widget/circularButton.dart';

import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/project.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/reference.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/signature.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/user_image.dart';

class ResumeCreateScreen extends StatefulWidget {

  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{
  // final accountKey = GlobalKey<State<Account>>();
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
            FormContent(
              icon: Icons.person, title: "Account", canAdd: true,
              content: (x){
                return Account(model: x.accountsModel,);
              },
            ),
            LinearContainer(),
            FormContent(icon: Icons.school, title: "Academic", canAdd: true,
              content: (x){
                return Academic( model: x.academicModel,);
              },),
            LinearContainer(),
            FormContent(icon: Icons.work, title: "Experience", canAdd: true,
              content: (x){
                return Experience(model: x.experienceModel,);
              },),
            LinearContainer(),
            FormContent(icon: Icons.assignment, title: "Project", canAdd: true,
              content: (x){
                return Project(model: x.projectModel,);
              },
            ),
            LinearContainer(),
            FormContent(icon: Icons.connect_without_contact, title: "Reference", canAdd: true,
              content: (x){
                return Reference(model: x.referenceModel,);
              },),
            LinearContainer(),
            FormContent(icon: Icons.camera, title: "Image", canAdd: true,
              content: (x){
                return UserImage(model: x.imageModel,);
              },),
            LinearContainer(),
            FormContent(icon: Icons.gesture, title: "Signature", canAdd: true, content: (x) {
              return SignatureSection();
            },),
            LinearContainer(),
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
  final bool canAdd;
  final Widget Function(FormContentModel) content;
  const FormContent({Key? key, required this.icon, required this.title, required this.canAdd, required this.content, }) : super(key: key);

  @override
  _FormContentState createState() => _FormContentState();
}

class _FormContentState extends State<FormContent>with AppTheme {



  bool _isShowing= false;
  bool added = true;



  void _toggleViewer() {
    setState(() {
      _isShowing = !_isShowing;
    });
  }
  final List<FormContentModel> _cardList=[];
  // final List<AccountsModel> accountList =[];
  // final List<AcademicModel> academicList =[];
  // final List<ExperienceModel> experienceList =[];
  // final List<ProjectModel> projectList =[];
  // final List<ReferenceModel> referenceList =[];



  void _addCardWidget() {
    setState(() {
       added = false;
       _cardList.add(FormContentModel());
      // academicList.add(FormContentModel().academicModel);
      //  accountList.add(AccountsModel.empty());
    });
  }

  void _deleteContent(){
    setState(() {
      if(_cardList.length>0)
        _cardList.removeLast();
    });

  }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _cardList.add(widget.content(context));
  // }

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
          _isShowing?Container(
                child: Column(
                    children: [
                      widget.canAdd?Column(
                        children: _cardList.map((e) => widget.content(e)).toList()
                      ): widget.content(FormContentModel()),



                      // Text('Tap the "+" button to add Fields'),
                       SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (_cardList.length>0)CircularButton(onTap: _deleteContent, icon: Icons.delete),
                            widget.canAdd?CircularButton(onTap: _addCardWidget, icon: Icons.add):Offstage(),



                            CircularButton(onTap: _toggleViewer, icon: Icons.check),
                          ],
                        ),
                      ),
                    ]
                ),
              ):Offstage(),



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



