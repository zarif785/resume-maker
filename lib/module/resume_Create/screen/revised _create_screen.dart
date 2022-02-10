// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:resume_maker/common/model/AcademicModel.dart';
// import 'package:resume_maker/common/model/AccountsModel.dart';
// import 'package:resume_maker/common/model/ExperienceModel.dart';
// import 'package:resume_maker/common/model/FormContentModels.dart';
// import 'package:resume_maker/common/model/ProjectModel.dart';
// import 'package:resume_maker/common/model/ReferenceModel.dart';
// import 'package:resume_maker/common/theme/appTheme.dart';
// import 'package:resume_maker/common/utils/Toasty.dart';
// import 'package:resume_maker/common/widget/titleCard.dart';
// import 'package:resume_maker/module/resume_Create/screen/resumeForm/account.dart';
// import 'package:resume_maker/module/resume_Create/service/resume_create_screen_service.dart';
// import 'resumeForm/academic.dart';
//
//
// class ResumeCreateNew extends StatefulWidget {
//   const ResumeCreateNew({Key? key}) : super(key: key);
//
//   @override
//   _ResumeCreateNewState createState() => _ResumeCreateNewState();
// }
//
// class _ResumeCreateNewState extends State<ResumeCreateNew> with AppTheme,ResumeCreateService {
//   PageController controller = PageController();
//   int i =0;
//   final FormContentModel x = FormContentModel();
//   final AcademicListModel listModel = AcademicListModel.empty();
//   final List<AcademicModel> academicList =[];
//   final List<ProjectModel> projectList =[];
//   final List<ExperienceModel> experienceList =[];
//   final List<ReferenceModel> referenceList =[];
//
//     void addFormWidget(int i) {
//       print(controller.page!.round());
//     setState(() {
//       if(i==1)academicList.add(AcademicModel.empty());
//       if(i==2)experienceList.add(x.experienceModel);
//       if(i==3)projectList.add(x.projectModel);
//       if(i==4)referenceList.add(x.referenceModel);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//         Stack(
//           children: [
//           StreamBuilder<String>(
//             initialData: "Account",
//             stream: formTitleStream,
//             builder: (context, snapshot) {
//               return Container(
//                 margin: EdgeInsets.only(top: 80.w),
//                 child: Center(
//                   child: Text(
//                     snapshot.data!,
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               );
//             }
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: GestureDetector(
//               onTap: (){
//                 addFormWidget(controller.page!.round());
//
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s8),
//                 margin: EdgeInsets.only(top: 80.w,right: size.s8),
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.s8),
//                   color: clr.appBlack,
//                 ),
//                 child: Text(
//                   "+",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],),
//             SizedBox(height: size.s20,),
//             StreamBuilder<String>(
//               stream: stepNumberStream,
//               initialData: "Step 1 out of 7",
//               builder: (context, snapshot) {
//                 return Text(
//                     snapshot.data!,
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 );
//               }
//             ),
//             SizedBox(height: size.s20,),
//             TitleCardWidget(
//               onItemChanged: (x) {
//                     controller.animateToPage(x,
//                         duration: Duration(milliseconds: 100),
//                         curve: Curves.ease);
//                   },
//             ),
//             SizedBox(height: size.s20,),
//           Flexible(child: PageView.builder(
//               onPageChanged: onContentChanged,
//               physics: BouncingScrollPhysics(),
//               itemCount: 7,
//               controller: controller,
//               itemBuilder: (context, index){
//                 i = index;
//                 return SingleChildScrollView(
//                   child: index==0? Account(model: AccountsModel.empty()):
//                   index==1?Column(
//                     children: academicList.map((e) => Academic(model: e)).toList(),
//                   ):Offstage(),
//                 );
//
//               },
//           )  ),
//
//             // SizedBox(height: size.s20,),
//           ],
//         ));
//   }
//
//
//
//   @override
//   void showWarning(String message, bool successValue) {
//     if(successValue)
//     Toasty.of(context).showSuccess(message);
//     else{
//       Toasty.of(context).showWarning(message);
//     }
//   }
// }
// //
// // if(index==0) return Account(model: AccountsModel.empty());
// // else if(index==1)return Academic(model: AcademicModel.empty());
// // else if(index==2) return Experience(model: ExperienceModel.empty());
// // else if(index==3)return Project(model: ProjectModel.empty());
// // else if(index==4)return Reference(model: ReferenceModel.empty());
// // else if(index==5)return UserImage(model: ImageModel.empty());
// // else return SignatureSection(model: SignatureModel.empty());