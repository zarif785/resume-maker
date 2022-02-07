
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/date_input_field.dart';
import 'package:resume_maker/common/widget/textField.dart';
import 'package:resume_maker/module/resume_Create/service/resume_create_screen_service.dart';

class Academic extends StatefulWidget {
  final AcademicModel model;
  const Academic({Key? key, required this.model,}) : super(key: key);

  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> with AppTheme{
  final TextEditingController degree = TextEditingController();
  final TextEditingController institute = TextEditingController();
  final TextEditingController cgpa = TextEditingController();
  final TextEditingController year = TextEditingController();

  // final FormContentModel model;
  int? _value =0;
  bool active = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    degree.text = widget.model.examName;
    institute.text= widget.model.institute;
    cgpa.text = widget.model.cgpa.toString();
    year.text = widget.model.year;
    if(widget.model.isPursuing ==false){
      _value =1;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
              TextFieldWidget(initialValue:widget.model.examName,onTextChanged: (x){widget.model.examName = x;}, type: 'degree', hintText: 'Exam Name',),
              TextFieldWidget(initialValue:widget.model.institute,onTextChanged: (x){widget.model.institute = x;}, type: 'name', hintText: 'Institute Name',),
              TextFieldWidget(initialValue:widget.model.cgpa.toString(),onTextChanged: (x){widget.model.cgpa = double.tryParse(x)??0.0;}, type: 'number', hintText: 'CGPA',),

              Row(
                children: [
                  Radio(
                    value:1,
                    groupValue: _value ,
                    onChanged: (int? value){
                      setState(() {
                         _value= value;
                      });
                    },
                  ),

                  Text("Completed"),

                  Radio(
                    value:2,
                    groupValue: _value ,
                    onChanged: (int? value){
                      setState(() {
                        _value= value;
                        active= true;
                      });
                    },
                  ),

                  Text("Pursuing"),
                ],
              ),

        _value==1? TextFieldWidget(initialValue:widget.model.year.toString(),onTextChanged: (x){widget.model.year = x;}, type: 'number', hintText: 'Passing Year',):Offstage(),



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
}
