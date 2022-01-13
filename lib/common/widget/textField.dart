import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

class TextFieldWidget extends StatelessWidget with AppTheme{
  final TextEditingController controller;
  final String hintText;
  final String type;
  const TextFieldWidget({Key? key, required this.controller, required this.hintText, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s4),
      padding: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s4),
      decoration: BoxDecoration(
        color: clr.appWhite,
        border: Border.all(
          color: clr.appBlack,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(size.s12),
      ),
      child: TextField(
        obscureText:  type=='password'? true:false,
        controller: controller,
        keyboardType: type=='email'? TextInputType.emailAddress: type=='number'?TextInputType.number:TextInputType.text,
        maxLines: 1,
        minLines: 1,
        style: TextStyle(
          color: clr.appBlack,
          fontSize: size.textSmall,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: clr.appBlack,
              fontSize: size.textSmall,
            )
        ),
      ),
    );
  }
}
