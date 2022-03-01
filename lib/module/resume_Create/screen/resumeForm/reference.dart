import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';


class Reference extends StatefulWidget {
  final ReferenceModel model;
  final VoidCallback? onClicked;
  const Reference({Key? key, required this.model, this.onClicked}) : super(key: key);

  @override
  _ReferenceState createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> with AppTheme,AutomaticKeepAliveClientMixin{
      final name = TextEditingController();
    final designation = TextEditingController();
    final institute = TextEditingController();
    final email = TextEditingController();
    final mobile_no = TextEditingController();


      void initState() {
        // name.text = widget.model.referenceModel.name;
        // designation.text = widget.model.referenceModel.designation;
        // institute.text = widget.model.referenceModel.institution;
        // email.text = widget.model.referenceModel.email;
        // mobile_no.text = widget.model.referenceModel.contactNo;
        name.text = widget.model.name;
        designation.text = widget.model.designation;
        institute.text = widget.model.organization;
        email.text = widget.model.email;
        mobile_no.text = widget.model.contactNo;

        super.initState();

      }

      onChange(){
        // widget.model.referenceModel.name = name.text;
        // widget.model.referenceModel.designation = designation.text;
        // widget.model.referenceModel.institution = institute.text;
        // widget.model.referenceModel.email = email.text;
        // widget.model.referenceModel.contactNo = mobile_no.text;
        widget.model.name = name.text;
        widget.model.designation = designation.text;
        widget.model.organization = institute.text;
        widget.model.email = email.text;
        widget.model.contactNo = mobile_no.text;
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
        TextFieldWidget(hintText: 'Name', type: 'name',initialValue:widget.model.name,onTextChanged: (x){widget.model.name = x;}
        ),
        TextFieldWidget(hintText: 'Designation', type: 'name',initialValue:widget.model.designation,onTextChanged: (x){widget.model.designation = x;}
        ),
        TextFieldWidget(hintText: 'Organization', type: 'name',initialValue:widget.model.organization,onTextChanged: (x){widget.model.organization = x;}
        ),
        TextFieldWidget(hintText: 'Email', type: 'email',initialValue:widget.model.email,onTextChanged: (x){widget.model.email = x;}
        ),
        TextFieldWidget(hintText: 'Number', type: 'number',initialValue:widget.model.contactNo,onTextChanged: (x){widget.model.contactNo = x;}
        ),
        SizedBox(height: size.s12,),
        Divider(
          thickness: 1,
          indent: size.s20,
          endIndent: size.s20,
        ),

        SizedBox(height: size.s12,),
        // CircularButton(onTap: onChange, icon: Icons.save),


      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
