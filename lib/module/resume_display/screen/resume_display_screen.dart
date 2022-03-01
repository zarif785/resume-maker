import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ImageModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';

class ResumeDisplay extends StatefulWidget {
  final AccountsModel accountsModel;
  final AcademicListModel academicListModel;
  final ExperienceListModel experienceListModel;
  final ProjectListModel projectListModel;
  final ReferenceListModel referenceListModel;
  final ImageModel imageModel;
  const ResumeDisplay({Key? key, required this.academicListModel, required this.accountsModel, required this.experienceListModel, required this.projectListModel, required this.referenceListModel, required this.imageModel}) : super(key: key);

  @override
  _ResumeDisplayState createState() => _ResumeDisplayState();
}

class _ResumeDisplayState extends State<ResumeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.academicListModel.academicData.map((e) => Text(e.id.toString())).toList(),
            Text(widget.accountsModel.address!),
            ...widget.referenceListModel.referenceData.map((e) => Text(e.email)),
            ...widget.projectListModel.projectData.map((e) => Text(e.role)),
          ],
        ),
      ),
    );
  }
}
