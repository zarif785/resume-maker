import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

class LoginTextFieldWidget extends StatefulWidget{
  final TextEditingController? controller;
  final String hintText;
  final String type;
  const LoginTextFieldWidget({Key? key, this.controller, required this.hintText, required this.type}) : super(key: key);

  @override
  State<LoginTextFieldWidget> createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> with AppTheme {


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

        obscureText:  widget.type=='password'? true:false,
        controller: widget.controller,
        keyboardType: widget.type=='email'? TextInputType.emailAddress: widget.type=='number'?TextInputType.number:TextInputType.text,
        maxLines: 1,
        minLines: 1,
        style: TextStyle(
            color: Colors.black,
            fontSize: size.textSmall,
            fontWeight: FontWeight.w600
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: size.textSmall,
            )
        ),
      ),
    );
  }
}
