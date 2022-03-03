import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ImageModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/module/resume_display/service/resume_display_service.dart';

class ResumeDisplay extends StatefulWidget {

  const ResumeDisplay({Key? key,}) : super(key: key);

  @override
  _ResumeDisplayState createState() => _ResumeDisplayState();
}


class _ResumeDisplayState extends State<ResumeDisplay> with ResumeDisplayService {

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { getAccountsDetails();});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PageState>(
              initialData: LoadingState(),
               stream: userInfoStream,
              builder: (context, snapshot){
                var state = snapshot.data;
                if(state is DataLoadedState){
                  return Column(
                    children: [
                      Text(state.data.accountsModel!.name),
                      ...state.data.academicListModel!.academicData.map((e) => Text(e.id.toString())),
                      ... state.data.experienceListModel!.experienceData.map((e) => Text(e.organizationName)),
                      state.data.projectListModel == null? Offstage():
                      Column(
                        children:state.data.projectListModel!.projectData.map((e) => Text(e.projectName)).toList(),
                      ),

                      ...state.data.referenceListModel!.referenceData.map((e) => Text(e.email)),


                    ],
                  );
                }
                else{
                  return CircularProgressIndicator();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
