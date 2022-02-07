import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/common/widget/action_button.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
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
    with ResumeCreateService, AppTheme {
  final PageController controller = PageController();

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
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  onItemChanged: (x) {
                    controller.animateToPage(x,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Flexible(
                    child: Container(
                      // color: Colors.red,
                      child: ResumeContent(
                        controller: controller,
                        onContentChanged: onContentChanged,
                      ),
                    )),



              ]),
        ),
      ),
    );
  }

  @override
  void showWarning(String message,bool successValue) {
    Toasty.of(context).showWarning(message);
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

class _ResumeContentState extends State<ResumeContent> with ResumeCreateService,AppTheme{
  final FormContentModel x = FormContentModel();
  final AcademicListModel listModel = AcademicListModel.empty();
  final List<AcademicModel> academicList =[];
  final List<ProjectModel> projectList =[];
  final List<ExperienceModel> experienceList =[];
  final List<ReferenceModel> referenceList =[];


  // Controllers //

  // Accounts//
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  // Academic //
  TextEditingController degree = TextEditingController();
  TextEditingController institute = TextEditingController();
  TextEditingController cgpa = TextEditingController();




  @override
  void initState() {

    super.initState();
    listModel.academicData.add(x.academicModel);
    academicList.add(x.academicModel);
    experienceList.add(x.experienceModel);
    projectList.add(x.projectModel);
    referenceList.add(x.referenceModel);
  }

  void addFormWidget(int i) {
    setState(() {
      if(i==1)listModel.academicData.add(AcademicModel.empty());
      if(i==2)experienceList.add(x.experienceModel);
      if(i==3)projectList.add(x.projectModel);
      if(i==4)referenceList.add(x.referenceModel);
    });
  }

  void _deleteContent(){
    setState(() {
      if( listModel.academicData.length>1)
      listModel.academicData.removeLast();
      if(experienceList.length>1)
        experienceList.removeLast();
     if(projectList.length>1)
       projectList.removeLast();
     if(referenceList.length>1)
       referenceList.removeLast();
    });

  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 7,
        onPageChanged: widget.onContentChanged,
        itemBuilder: (context, index) {

          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (index == 0)
                  StreamBuilder<PageState>(
                      initialData: LoadingState(),
                      stream: accountsInfoStream,
                    builder: (context, snapshot) {
                      var state = snapshot.data;
                      if (state is DataLoadedState) {
                        x.accountsModel = state.data;
                        usernameController.text = state.data.name!;
                        mobileNoController.text = state.data.contactNo!;
                        addressController.text = state.data.address!;
                        return Column(
                          children: [ Account(
                            model: x.accountsModel,
                            usernameController: usernameController,
                            addressController: addressController,
                            emailController: emailController,
                            mobileNoController: mobileNoController,
                          ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CircularButton(onTap: () {
                                validateAccountFormData(
                                    usernameController.text,
                                    addressController.text,
                                    mobileNoController.text).then((value) {
                                  if (value == true) {
                                    saveDetails(usernameController.text,
                                      mobileNoController.text,
                                      addressController.text,);
                                  }
                                });
                              }, child: Icon(Icons.save, color: clr.appWhite,)),
                            ),
                          ],
                        );
                      }
                      else{
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  ),


                if (index == 1)
                  Column(
                    children: [
                      Column(
                        children: listModel.academicData.map((e) => Academic(model: e)).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularButton(onTap: () {
                          // validateAcademicFormData(
                          //   degree.text,
                          //   institute.text,
                          //   cgpa.text,
                          //    ).then((value) {
                          //   if (value == true) {
                          //
                          //     saveAccountList(listModel);
                          //   }
                          // });

                          if(listModel.academicData.every((m){
                            if(Validator.isEmpty(m.examName)){
                              Toasty.of(context).showWarning("Exam name is required!",);
                              return false;
                            }
                            // else if(Validator.isEmpty(institute)){
                            //   _view.showWarning("Institute name is required!",false);
                            //   _completer.complete(false);
                            //   return _completer.future;
                            // }
                            // // else if(isCompleted == true && Validator.isEmpty(year)){
                            // //   _view.showWarning("Passing Year is required!",false);
                            // //   _completer.complete(false);
                            // //   return _completer.future;
                            // // }
                            // else if( Validator.isEmpty(cgpa)){
                            //   _view.showWarning("CGPA is required!",false);
                            //   _completer.complete(false);
                            //   return _completer.future;
                            // }
                            else{
                              return true;
                            }
                          })){
                            saveAccountList(listModel);
                          }
                        }, child: Icon(Icons.save, color: clr.appWhite,)),
                      ),
                    ],
                  ),
                if (index == 2)
                  Column(
                    children: experienceList.map((e) => Experience(model: e,)).toList(),
                  ),
                if (index == 3)
                  Column(
                    children: projectList.map((e) => Project(model: e,)).toList(),
                  ),
                if (index == 4)
                  Column(
                    children: referenceList.map((e) => Reference(model: e,)).toList(),
                  ),
                if (index == 5)
                  UserImage(
                    model: x.imageModel,
                  ),
                if (index == 6)
                  SignatureSection(
                    model: x.signatureModel,
                  ),
                !(index==0||index==5||index==6)?Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularButton(onTap: _deleteContent, child: Icon(Icons.delete,color: Colors.white,)),
                    ),


                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularButton(onTap: (){
                        addFormWidget(index);
                      }, child: Icon(Icons.add,color: Colors.white,)),
                    ),
                  ],
                ):Offstage(),
              ],
            ),
          );
        });
  }

  @override
  void showWarning(String message, bool successValue) {
    if(successValue) {
      Toasty.of(context).showSuccess(message);
    }
    else{
      Toasty.of(context).showWarning(message);
    }
  }
}


