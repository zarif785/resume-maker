import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/model/SignatureModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/titleCard.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/project.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/reference.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/signature.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/user_image.dart';
import 'package:resume_maker/module/resume_Create/service/resume_create_screen_service.dart';
import 'package:resume_maker/module/resume_display/screen/resume_display_screen.dart';
import 'resumeForm/academic.dart';

class ResumeCreateNew extends StatefulWidget {
  const ResumeCreateNew({Key? key}) : super(key: key);

  @override
  _ResumeCreateNewState createState() => _ResumeCreateNewState();
}

class _ResumeCreateNewState extends State<ResumeCreateNew>
    with AppTheme, ResumeCreateService {
  PageController controller = PageController();
  final FormContentModel x = FormContentModel();
  AcademicListModel listModel = AcademicListModel.empty();
  ExperienceListModel _experienceListModel = ExperienceListModel.empty();
  ProjectListModel _projectListModel = ProjectListModel.empty();
  ReferenceListModel _referenceListModel = ReferenceListModel.empty();

  void addFormWidget(int i) {
    print(controller.page!.round());
    setState(() {
      if (i == 1) listModel.academicData.add(AcademicModel.empty());
      if (i == 2)
        _experienceListModel.experienceData.add(ExperienceModel.empty());
      if (i == 3) _projectListModel.projectData.add(ProjectModel.empty());
      if (i == 4) _referenceListModel.referenceData.add(ReferenceModel.empty());
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // status bar color
    ));
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                    }),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      addFormWidget(controller.page!.round());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.s16, vertical: size.s8),
                      margin: EdgeInsets.only(top: 80.w, right: size.s8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.s8),
                        color: clr.appBlack,
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 20,
                          color: clr.appWhite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.s20,
            ),
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
                }),
            SizedBox(
              height: size.s20,
            ),
            TitleCardWidget(
              onItemChanged: (x) {
                controller.animateToPage(x,
                    duration: Duration(milliseconds: 100), curve: Curves.ease);
              },
            ),
            SizedBox(
              height: size.s20,
            ),
            Flexible(
                child: PageView.builder(
              onPageChanged: onContentChanged,
              physics: BouncingScrollPhysics(),
              itemCount: 7,
              controller: controller,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      StreamBuilder<PageState>(
                        initialData: LoadingState(),
                        stream: userInfoStream,
                        builder: (context, snapshot) {
                          var state = snapshot.data;
                          if (state is DataLoadedState && index == 0) {
                            x.accountsModel = state.data;
                            return Column(
                              children: [
                                Account(
                                  model: x.accountsModel,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularButton(
                                      onTap: () {
                                        validateAccountFormData(
                                          x.accountsModel.name,
                                          x.accountsModel.address,
                                          x.accountsModel.contactNo,
                                        ).then((value) {
                                          if (value == true) {
                                            saveDetails(
                                              x.accountsModel.name,
                                              x.accountsModel.contactNo,
                                              x.accountsModel.address,
                                            );
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.save,
                                        color: clr.appWhite,
                                      )),
                                ),
                              ],
                            );
                          } else if (index == 1 &&
                              state is AcademicLoadedState) {
                            listModel = state.data;
                            return Column(
                              children: [
                                listModel.academicData.length > 0
                                    ? Column(
                                        children: listModel.academicData
                                            .map((e) => Academic(
                                                  key: ObjectKey(DateTime.now()
                                                      .toString()),
                                                  model: e,
                                                  onClicked: () {
                                                    listModel.academicData
                                                        .removeWhere(
                                                            (element) =>
                                                                element.id ==
                                                                e.id);
                                                    setState(() {
                                                      deleteAcademicInfo(e.id);
                                                    });
                                                  },
                                                ))
                                            .toList(),
                                      )
                                    : Text(
                                        "Press the  +  button to add your field"),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularButton(
                                      onTap: () {
                                        if (listModel.academicData.every((m) {
                                          if (Validator.isEmpty(m.examName)) {
                                            Toasty.of(context).showWarning(
                                              "Exam name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(m.institute)) {
                                            Toasty.of(context).showWarning(
                                              "Institute name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(
                                              m.cgpa.toString())) {
                                            Toasty.of(context).showWarning(
                                              "CGPA name is required!",
                                            );
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        })) {
                                          setAcademicDetails(listModel);
                                        }
                                      },
                                      child: Icon(
                                        Icons.save,
                                        color: clr.appWhite,
                                      )),
                                ),
                              ],
                            );
                          } else if (index == 2 &&
                              state is ExperienceLoadedState) {
                            _experienceListModel = state.data;
                            return Column(
                              children: [
                                _experienceListModel.experienceData.length > 0
                                    ? Column(
                                        children: _experienceListModel
                                            .experienceData
                                            .map((e) => Experience(
                                                  model: e,
                                                  onClicked: () {
                                                    _experienceListModel
                                                        .experienceData
                                                        .removeWhere(
                                                            (element) =>
                                                                element.id ==
                                                                e.id);
                                                    setState(() {
                                                      deleteExperienceInfo(
                                                          e.id);
                                                    });
                                                  },
                                                ))
                                            .toList(),
                                      )
                                    : Text(
                                        "Press the  +  button to add your field"),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularButton(
                                      onTap: () {
                                        if (_experienceListModel.experienceData
                                            .every((m) {
                                          if (Validator.isEmpty(
                                              m.organizationName)) {
                                            Toasty.of(context).showWarning(
                                              "Organization name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(
                                              m.designation)) {
                                            Toasty.of(context).showWarning(
                                              "Designation is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(m.startDate)) {
                                            Toasty.of(context).showWarning(
                                              "Start Year is required",
                                            );
                                            return false;
                                          }

                                          if (Validator.isEmpty(m.endDate)) {
                                            Toasty.of(context).showWarning(
                                              "End Year is required",
                                            );
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        })) {
                                          setExperienceDetails(
                                              _experienceListModel);
                                        }
                                      },
                                      child: Icon(
                                        Icons.save,
                                        color: clr.appWhite,
                                      )),
                                ),
                              ],
                            );
                          } else if (index == 3 &&
                              state is ProjectLoadedState) {
                            _projectListModel = state.data;
                            return Column(
                              children: [
                                _projectListModel.projectData.length > 0
                                    ? Column(
                                        children: _projectListModel.projectData
                                            .map((e) => Project(
                                                  model: e,
                                                  onClicked: () {
                                                    _projectListModel.projectData
                                                        .removeWhere(
                                                            (element) =>
                                                                element.id ==
                                                                e.id);
                                                    deleteProjectInfo(
                                                        e.id);
                                                    setState(() {

                                                    });
                                                  },
                                                ))
                                            .toList(),
                                      )
                                    : Text(
                                        "Press the  +  button to add your field"),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularButton(
                                      onTap: () {
                                        if (_projectListModel.projectData
                                            .every((m) {
                                          if (Validator.isEmpty(
                                              m.projectName)) {
                                            Toasty.of(context).showWarning(
                                              "Project name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(m.role)) {
                                            Toasty.of(context).showWarning(
                                              "Role name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(
                                              m.description)) {
                                            Toasty.of(context).showWarning(
                                              "Description is required!",
                                            );
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        })) {
                                          setProjectDetails(_projectListModel);
                                        }
                                      },
                                      child: Icon(
                                        Icons.save,
                                        color: clr.appWhite,
                                      )),
                                ),
                              ],
                            );
                          } else if (index == 4 &&
                              state is ReferenceLoadedState) {
                            _referenceListModel = state.data;
                            return Column(
                              children: [
                                _referenceListModel.referenceData.length > 0
                                    ? Column(
                                        children: _referenceListModel
                                            .referenceData
                                            .map((e) => Reference(model: e,
                                              onClicked: (){
                                                _referenceListModel
                                                    .referenceData
                                                    .removeWhere(
                                                        (element) =>
                                                    element.id ==
                                                        e.id);
                                                deleteReferenceInfo(
                                                    e.id);
                                                setState(() {

                                                });
                                              },
                                          ))
                                            .toList(),
                                      )
                                    : Text(
                                        "Press the  +  button to add your field"),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularButton(
                                      onTap: () {
                                        if (_referenceListModel.referenceData
                                            .every((m) {
                                          if (Validator.isEmpty(m.name)) {
                                            Toasty.of(context).showWarning(
                                              "Name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(
                                              m.designation)) {
                                            Toasty.of(context).showWarning(
                                              "Designation name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(
                                              m.organization)) {
                                            Toasty.of(context).showWarning(
                                              "Organization name is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(m.email)) {
                                            Toasty.of(context).showWarning(
                                              "Email is required!",
                                            );
                                            return false;
                                          }
                                          if (Validator.isEmpty(m.contactNo)) {
                                            Toasty.of(context).showWarning(
                                              "Contact Number is required!",
                                            );
                                            return false;
                                          } else {
                                            return true;
                                          }
                                        })) {
                                          setReferenceDetails(
                                              _referenceListModel);
                                        }
                                      },
                                      child: Icon(
                                        Icons.save,
                                        color: clr.appWhite,
                                      )),
                                ),
                              ],
                            );
                          } else if (index == 5) {
                            return Column(
                              children: [
                                UserImage(model: x.imageModel),
                              ],
                            );
                          } else if (index == 6) {
                            return Column(
                              children: [
                                SignatureSection(model: SignatureModel.empty())
                              ],
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.all(64.w),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            )),

            StreamBuilder<bool>(
                initialData: false,
                stream: buttonStateStream,
                builder: (context, snapshot) {
                  return snapshot.data == true
                      ? Container(
                          margin: EdgeInsets.only(bottom: 40.w),
                          child: Center(
                              child: CircularButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResumeDisplay()),
                              );
                            },
                            child: Text(
                              'Generate',
                              style: TextStyle(
                                  color: clr.appWhite,
                                  fontSize: size.textMedium,
                                  fontWeight: FontWeight.w700),
                            ),
                          )),
                        )
                      : Offstage();
                }),
            // SizedBox(height: size.s20,),
          ],
        ));
  }

  @override
  void showWarning(String message, bool successValue) {
    if (successValue)
      Toasty.of(context).showSuccess(message);
    else {
      Toasty.of(context).showWarning(message);
    }
  }
}
