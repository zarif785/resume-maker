import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/module/resume_display/service/resume_display_service.dart';

class ResumeDisplay extends StatefulWidget {
  const ResumeDisplay({
    Key? key,
  }) : super(key: key);

  @override
  _ResumeDisplayState createState() => _ResumeDisplayState();
}

class _ResumeDisplayState extends State<ResumeDisplay>
    with ResumeDisplayService, AppTheme {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getAccountsDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: StreamBuilder<PageState>(
        initialData: LoadingState(),
        stream: userInfoStream,
        builder: (context, snapshot) {
            var state = snapshot.data;
            if (state is DataLoadedState) {
              var data = state.data;
              return Container(
                padding: EdgeInsets.all(size.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(data.accountsModel!.name,
                        style: TextStyle(
                            fontSize: size.textLarge,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(data.accountsModel!.email),
                        Text(" I ", style: TextStyle(fontSize: size.textLarge),),
                        Text(data.accountsModel!.contactNo),
                        Text(" I ", style: TextStyle(fontSize: size.textLarge),),
                        Text(data.accountsModel!.address),
                      ],
                    ),
                    SizedBox(
                      height: size.s24,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Professional Summary",
                        style: TextStyle(
                          fontSize: size.textMedium,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 8,),
                    Text(
                        'Seeking a beginner role to enhance and explore my technical knowledge gained at Xyz University in the last three years. I hold a B.Tech degree from XYZ college and won the quiz challenge held at the campus. '),
                    SizedBox(height: 14,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Academic",
                        style: TextStyle(
                            fontSize: size.textMedium,
                            fontWeight: FontWeight.w600
                        ),

                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ...data.academicListModel!.academicData.map((e){

                      return Container(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Exam Name : ${e.examName}"),
                            Text("Institute : ${e.institute}"),
                            Text("CGPA : ${e.cgpa}"),
                            Text("Passing Year : ${e.year}"),

                            SizedBox(height: size.s8,)
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 8,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Experience",
                        style: TextStyle(
                            fontSize: size.textMedium,
                            fontWeight: FontWeight.w600
                        ),

                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ...data.experienceListModel!.experienceData.map((e){

                      return Container(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Designation : ${e.designation}"),
                            Text("Organization : ${e.organizationName}"),
                            e.endDate.isNotEmpty?Text("Duration : ${e.startDate} - Passing Year : ${e.endDate}"):Text("Duration : ${e.startDate} - Present"),

                            SizedBox(height: size.s8,)
                          ],
                        ),
                      );
                    }),

                    SizedBox(height: 8,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Project",
                        style: TextStyle(
                            fontSize: size.textMedium,
                            fontWeight: FontWeight.w600
                        ),

                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ...data.projectListModel!.projectData.map((e){

                      return Container(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Project Name : ${e.projectName}"),
                            Text("Organization : ${e.role}"),
                            Text("Project Description :"),
                            Text(e.description),
                            Text("Project Link: ${e.link}"),
                            SizedBox(height: size.s8,)
                          ],
                        ),
                      );
                    }),

                    SizedBox(height: 8,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Reference",
                        style: TextStyle(
                            fontSize: size.textMedium,
                            fontWeight: FontWeight.w600
                        ),

                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ...data.referenceListModel!.referenceData.map((e){

                      return Container(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${e.name}"),
                            Text("Designation : ${e.designation}"),
                            Text("Organization: ${e.organization}"),
                            Text("Contact Number: ${e.contactNo}"),
                            Text("Email: ${e.email}"),
                            SizedBox(height: size.s8,)
                          ],
                        ),
                      );
                    }),

                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
          )),
    );
  }
}
