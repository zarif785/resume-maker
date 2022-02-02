import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/widget/AlertBox.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/stepper.dart';
import 'package:resume_maker/common/widget/titleCard.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/project.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/reference.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/signature.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/user_image.dart';
import 'package:resume_maker/module/resume_Create/service/resume_create_screen_service.dart';

class ResumeCreateNew extends StatefulWidget {
  const ResumeCreateNew({Key? key}) : super(key: key);

  @override
  _ResumeCreateNewState createState() => _ResumeCreateNewState();
}

class _ResumeCreateNewState extends State<ResumeCreateNew>
    with ResumeCreateService,AppTheme{
  final PageController controller = PageController(initialPage: 0, keepPage: false, viewportFraction: 0.4);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // status bar color
    ));
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
         resizeToAvoidBottomInset: false,
        body: Container(

          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            Center(
              child: StreamBuilder<String>(
                initialData: "Step 1 out of 7",
                stream: stepNumberStream,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: StreamBuilder<String>(
                initialData: "Account",
                stream: formTitleStream,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TitleCardWidget(
              onItemChanged: (e){
                  controller.animateToPage(e, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
              },
            ),

            SizedBox(
              height: 40,
            ),
            Flexible(

                child: ResumeContent(
              controller: controller,
              onContentChanged: onContentChanged,
            )),


          ]),
        ),
      ),
    );
  }
}

class ResumeContent extends StatefulWidget {
  final PageController controller;
  final ValueChanged<int> onContentChanged;

  const ResumeContent({
    Key? key,
    required this.controller,
    required this.onContentChanged,
  }) : super(key: key);

  @override
  _ResumeContentState createState() => _ResumeContentState();
}

class _ResumeContentState extends State<ResumeContent> {
  final FormContentModel x = FormContentModel();


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 7,
          onPageChanged: widget.onContentChanged,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (index == 0)
                      Flexible(
                        child: Account(
                          model: x,
                        ),
                      ),
                    if (index == 1)
                      Flexible(
                        child: Academic(
                          model: x,
                        ),
                      ),
                    if (index == 2)
                      Flexible(
                        child: Experience(
                          model: x,
                        ),
                      ),
                    if (index == 3)
                      Flexible(
                        child: Project(
                          model: x,
                        ),
                      ),
                    if (index == 4)
                      Flexible(
                        child: Reference(
                          model: x,
                        ),
                      ),
                    if (index == 5)
                      Flexible(
                        child: UserImage(
                          model: x,
                        ),
                      ),
                    if (index == 6)
                      Flexible(
                        child: Center(
                          child: SignatureSection(
                            model: x,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}


class TitleCardWidget extends StatefulWidget {
  final  ValueChanged<int> onItemChanged;
  const TitleCardWidget({Key? key, required this.onItemChanged,}) : super(key: key);


  @override
  State<TitleCardWidget> createState() => _TitleCardWidgetState();
}

class _TitleCardWidgetState extends State<TitleCardWidget>  with AppTheme{
  List<String> title = ['Account', 'Academic', 'Experience', 'Project', 'Reference', 'Image', 'Signature'];

  void _onTap(){

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children:title
              .map((e) => GestureDetector(
            onTap: (){
              widget.onItemChanged(title.indexOf(e));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 45,
              width: 140,
              decoration: new BoxDecoration(
                  color: clr.appBlack,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  e,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: clr.appWhite,
                      fontSize: size.textXMedium),
                ),
              ),
            ),
          ))
              .toList(),
        ));
  }
}
