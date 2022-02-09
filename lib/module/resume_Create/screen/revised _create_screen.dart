import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ImageModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/model/SignatureModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/widget/titleCard.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/reference.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/signature.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/user_image.dart';
import 'package:resume_maker/module/resume_Create/service/resume_create_screen_service.dart';

import 'resumeForm/academic.dart';
import 'resumeForm/project.dart';

class ResumeCreateNew extends StatefulWidget {
  const ResumeCreateNew({Key? key}) : super(key: key);

  @override
  _ResumeCreateNewState createState() => _ResumeCreateNewState();
}

class _ResumeCreateNewState extends State<ResumeCreateNew> with AppTheme,ResumeCreateService {
  PageController controller = PageController();
  // int i = 0;
  //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Stack(
          children: [
          StreamBuilder<String>(
            initialData: "Account",
            stream: formTitleStream,
            builder: (context, snapshot) {
              return Container(
                margin: EdgeInsets.only(top: 80.w),
                child: Center(
                  child: Text(
                    snapshot.data!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s8),
                margin: EdgeInsets.only(top: 80.w,right: size.s8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.s8),
                  color: clr.appBlack,
                ),
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],),
            SizedBox(height: size.s20,),
            StreamBuilder<String>(
              stream: stepNumberStream,
              initialData: "Step 1 out of 7",
              builder: (context, snapshot) {
                return Text(
                    snapshot.data!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }
            ),
            SizedBox(height: size.s20,),
            TitleCardWidget(
              onItemChanged: (x) {
                    controller.animateToPage(x,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.ease);
                  },
            ),
            SizedBox(height: size.s20,),
          Flexible(child: PageView.builder(
              onPageChanged: onContentChanged,
              physics: BouncingScrollPhysics(),
              itemCount: 7,
              controller: controller,
              itemBuilder: (context, index){
                if(index==0) return Account(model: AccountsModel.empty());
                else if(index==1)return Academic(model: AcademicModel.empty());
                else if(index==2) return Experience(model: ExperienceModel.empty());
                else if(index==3)return Project(model: ProjectModel.empty());
                else if(index==4)return Reference(model: ReferenceModel.empty());
                else if(index==5)return UserImage(model: ImageModel.empty());
                else return SignatureSection(model: SignatureModel.empty());

              },
          )  ),
            // SizedBox(height: size.s20,),
          ],
        ));
  }



  @override
  void showWarning(String message, bool successValue) {
    if(successValue)
    Toasty.of(context).showSuccess(message);
    else{
      Toasty.of(context).showWarning(message);
    }
  }
}


// PageView(
// controller: controller,
// children: [
// Account(model: AccountsModel.empty()),
// Academic(model: AcademicModel.empty()),
// Experience(model: ExperienceModel.empty()),
// Project(model: ProjectModel.empty()),
// Reference(model: ReferenceModel.empty()),
// UserImage(model: ImageModel.empty()),
// SignatureSection(model: SignatureModel.empty()),
//
// ],
// )