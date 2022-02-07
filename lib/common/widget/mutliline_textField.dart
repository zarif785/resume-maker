import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

class MultiLineTextFieldWidget extends StatefulWidget{
  final TextEditingController? controller;
  final String hintText;
  final String initialValue;
  final String type;
  final ValueChanged<String>? onTextChanged;
  final bool isRegistration;
  const MultiLineTextFieldWidget({Key? key, this.controller, required this.hintText, required this.type, this.onTextChanged, this.initialValue="", this.isRegistration=false}) : super(key: key);

  @override
  State<MultiLineTextFieldWidget> createState() => _MultiLineTextFieldWidgetState();
}

class _MultiLineTextFieldWidgetState extends State<MultiLineTextFieldWidget>  with AppTheme{
  late final TextEditingController _controller = TextEditingController(text:widget.initialValue);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s8),
      padding: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s42),
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
        controller: widget.isRegistration?widget.controller:_controller,
        keyboardType:TextInputType.multiline,
        maxLines: 8,
        minLines: 1,
        onChanged: widget.onTextChanged,
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
