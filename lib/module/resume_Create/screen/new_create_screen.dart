import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/widget/action_button.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
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
  final List<AcademicModel> academicList =[];
  final List<ProjectModel> projectList =[];
  final List<ExperienceModel> experienceList =[];
  final List<ReferenceModel> referenceList =[];


  // Controllers //
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();


  @override
  void initState() {

    super.initState();
    academicList.add(x.academicModel);
    experienceList.add(x.experienceModel);
    projectList.add(x.projectModel);
    referenceList.add(x.referenceModel);
  }

  void addFormWidget(int i) {
    setState(() {
      if(i==1)academicList.add(x.academicModel);
      if(i==2)experienceList.add(x.experienceModel);
      if(i==3)projectList.add(x.projectModel);
      if(i==4)referenceList.add(x.referenceModel);
    });
  }

  void _deleteContent(){
    setState(() {
      if(academicList.length>1)
        academicList.removeLast();
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
                  Column(
                    children: [                  Account(
                      model: x.accountsModel,usernameController: usernameController, addressController: addressController, emailController: emailController, mobileNoController: mobileNoController,
                    ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularButton(onTap: (){
                          validateAccountFormData(usernameController.text, addressController.text, mobileNoController.text).then((value){
                            if(value==true){
                              saveDetails(usernameController.text, addressController.text, mobileNoController.text);
                            }

                          } );
                        }, child: Icon(Icons.save,color: clr.appWhite,)),
                      ),
                    ],
                  ),


                if (index == 1)
                  Column(
                    children: academicList.map((e) => Academic(model: e,)).toList(),
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

class TitleCardWidget extends StatefulWidget {
  final ValueChanged<int> onItemChanged;
  const TitleCardWidget({
    Key? key,
    required this.onItemChanged,
  }) : super(key: key);

  @override
  State<TitleCardWidget> createState() => _TitleCardWidgetState();
}

class _TitleCardWidgetState extends State<TitleCardWidget> with AppTheme {
  List<String> title = [
    'Account',
    'Academic',
    'Experience',
    'Project',
    'Reference',
    'Image',
    'Signature'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: title
              .map((e) => GestureDetector(
                    onTap: () {
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
