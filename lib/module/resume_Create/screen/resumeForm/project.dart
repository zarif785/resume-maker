import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/date_input_field.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';

class Project extends StatefulWidget {
  // final FormContentModel model;
  final ProjectModel model;
  final VoidCallback? onClicked;
  const Project({Key? key, required this.model, this.onClicked}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> with AppTheme,AutomaticKeepAliveClientMixin{
  final projectName = TextEditingController();
  final description = TextEditingController();
  final role = TextEditingController();
  final links = TextEditingController();

  @override
  void initState() {
    // projectName.text = widget.model.projectModel.projectName;
    // description.text = widget.model.projectModel.description;
    // role.text = widget.model.projectModel.role;
    // links.text = widget.model.projectModel.link;
    projectName.text = widget.model.projectName;
    description.text = widget.model.description;
    role.text = widget.model.role;
    links.text = widget.model.link;

    super.initState();

  }

  onChange(){
    widget.model.projectName = projectName.text;
    widget.model.description = description.text;
    widget.model.role = role.text;
    widget.model.link = links.text;
    // widget.model.projectModel.projectName = projectName.text;
    // widget.model.projectModel.description = description.text;
    // widget.model.projectModel.role = role.text;
    // widget.model.projectModel.link = links.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:EdgeInsets.only(right: size.s16),
              child: CircularButton(onTap: widget.onClicked, child: Icon(Icons.delete,color: clr.appWhite,)),
            ),
          ],
        ),
        TextFieldWidget(hintText: 'Project Name', type: 'name',initialValue:widget.model.projectName,onTextChanged: (x){widget.model.projectName = x;}
        ),
        MultiLineTextFieldWidget(hintText: "Description", type: 'address',onTextChanged: (x){widget.model.description = x;},initialValue:widget.model.description),

        TextFieldWidget(hintText: 'Role', type: 'name',initialValue:widget.model.role,onTextChanged: (x){widget.model.role = x;}
        ),
        TextFieldWidget(hintText: 'Link(if any)', type: 'name',initialValue:widget.model.link,onTextChanged: (x){widget.model.link = x;}
        ),
        // CircularButton(onTap: onChange, icon: Icons.save),
        SizedBox(height: size.s12,),
        Divider(
          thickness: 1,
          indent: size.s20,
          endIndent: size.s20,
        ),

        SizedBox(height: size.s12,),


      ],

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

