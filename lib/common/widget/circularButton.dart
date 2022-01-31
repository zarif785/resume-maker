import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

class CircularButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData  icon;
  const CircularButton({Key? key, required this.onTap, required this.icon}) : super(key: key);

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> with AppTheme{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: clr.appBlack,
            borderRadius: BorderRadius.circular(50.r),

          ),
          child:Icon(widget.icon,color: Colors.white,)
      ),
    );
  }
}
