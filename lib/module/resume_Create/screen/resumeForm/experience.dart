
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/date_input_field.dart';
import 'package:resume_maker/common/widget/textField.dart';

class Experience extends StatefulWidget {
  // final FormContentModel model;
  final ExperienceModel model;
  final VoidCallback? onClicked;
  const Experience({Key? key, required this.model, this.onClicked}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> with AppTheme,AutomaticKeepAliveClientMixin{


    final TextEditingController organization = TextEditingController();
    final TextEditingController designation = TextEditingController();
    final TextEditingController startYear = TextEditingController();
    final TextEditingController endYear = TextEditingController();

    int _value= 0;

    @override
    void initState() {

      organization.text = widget.model.organizationName;
      designation.text = widget.model.designation;
      startYear.text = widget.model.startDate;
      endYear.text = widget.model.endDate;
      // if(widget.model.completed ==true ){
      //   _value =1;
      // }

      super.initState();

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
        TextFieldWidget(initialValue:widget.model.organizationName,onTextChanged: (x){widget.model.organizationName = x;}, type: 'degree', hintText: 'Organization Name',),
        TextFieldWidget(initialValue:widget.model.designation,onTextChanged: (x){widget.model.designation = x;}, type: 'degree', hintText: 'Designation',),
        TextFieldWidget(initialValue:widget.model.startDate,onTextChanged: (x){widget.model.startDate = x;}, type: 'number', hintText: 'Starting Year',),





                SizedBox(height: size.s20,),
        Row(
          children: [
            Radio(
              value:1,
              groupValue: _value ,
              onChanged: (int? value){
                setState(() {
                  _value= value!;

                });
              },
            ),

            Text("Left Job"),

            Radio(
              value:2,
              groupValue: _value ,
              onChanged: (int? value){
                setState(() {
                  _value= value!;

                });
              },
            ),

            Text("Still Active"),
          ],
        ),

        _value==1?TextFieldWidget(initialValue:widget.model.endDate,onTextChanged: (x){widget.model.endDate = x;}, type: 'number', hintText: 'Ending Year',):Offstage(),
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
