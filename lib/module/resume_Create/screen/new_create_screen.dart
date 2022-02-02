import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
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
    return Scaffold(
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
           if(e=='Reference'){
             print(e);
           }
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
// Spacer(),
// StreamBuilder<int>(
//   initialData: 1,
//   stream: buttonStateStream,
//   builder: (context, snapshot) {
//     var data = snapshot.data;
//     if (data == 1) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             // CircularButton(onTap: null, icon: Icons.arrow_back),
//             Spacer(),
//             CircularButton(
//                 onTap: null,
//                 child: Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 )),
//           ],
//         ),
//       );
//     } else if (data == 2) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             CircularButton(
//                 onTap: null,
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 )),
//             Spacer(),
//             CircularButton(
//                 onTap: null,
//                 child: Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 )),
//           ],
//         ),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             CircularButton(
//                 onTap: null,
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 )),
//             Spacer(),
//             CircularButton(
//                 onTap: null,
//                 child: Text(
//                   "GENERATE",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: size.textSmall,
//                     fontWeight: FontWeight.w600
//                   ),
//                 )),
//             // CircularButton(onTap: null, icon: Icons.arrow_forward),
//           ],
//         ),
//       );
//     }
//   },
// )
//