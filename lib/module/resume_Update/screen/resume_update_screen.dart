import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/textField.dart';
import 'package:resume_maker/common/widget/titleCard.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Update/service/resume_update_service.dart';

class ResumeUpdateScreen extends StatefulWidget {
  const ResumeUpdateScreen({Key? key}) : super(key: key);

  @override
  _ResumeUpdateScreenState createState() => _ResumeUpdateScreenState();
}

class _ResumeUpdateScreenState extends State<ResumeUpdateScreen> with ResumeUpdateService,AppTheme {
  final PageController controller = PageController();
  TextEditingController nameController  = TextEditingController();
  AccountsModel model = AccountsModel.empty();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // model = getAccountsDetails();
    super.initState();
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
                      child: ResumeUpdateContent(
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
  void showWarning(String message, bool successValue) {
    // TODO: implement showWarning
  }
}

class ResumeUpdateContent extends StatefulWidget {
  final PageController controller;
  final ValueChanged<int> onContentChanged;
  const ResumeUpdateContent({Key? key, required this.controller, required this.onContentChanged}) : super(key: key);

  @override
  _ResumeUpdateContentState createState() => _ResumeUpdateContentState();
}

class _ResumeUpdateContentState extends State<ResumeUpdateContent> with ResumeUpdateService,AppTheme{

  final FormContentModel x = FormContentModel();
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

  @override
  void initState() {

    super.initState();
    academicList.add(x.academicModel);
    experienceList.add(x.experienceModel);
    projectList.add(x.projectModel);
    referenceList.add(x.referenceModel);
  }



  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 7,
        onPageChanged: widget.onContentChanged,
        itemBuilder: (context, index){
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [

                if(index==0)
                  StreamBuilder<PageState>(
                    initialData: LoadingState(),
                    stream: academicInfoStream,
                    builder: (context,snapshot){
                      var data = snapshot.data;
                      if(data is DataLoadedState){
                        return Column(
                          children: data.data.academicData.map((e)=> Text(e.examName)).toList(),
                        );
                      }
                      else{
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                if (index == 1)
                  Column(
                    // children: academicList.map((e) => Academic(model: e,)).toList(),
                  ),
                !(index==0||index==5||index==6)?Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularButton(onTap: null, child: Icon(Icons.delete,color: Colors.white,)),
                    ),


                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularButton(onTap: (){

                      }, child: Icon(Icons.add,color: Colors.white,)),
                    ),
                  ],
                ):Offstage(),
              ],
            ),
          );
        }
    );
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
