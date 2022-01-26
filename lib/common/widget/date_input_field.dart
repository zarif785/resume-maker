import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

class DateInput extends StatefulWidget {
  final String hintText;

  const DateInput({Key? key, required this.hintText}) : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> with AppTheme{
  DateTime? _dateTime;
  datePicker(){
     showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              primaryColorDark: clr.appBlack,
              accentColor: clr.appBlack,
            ),
            dialogBackgroundColor:Colors.white,
          ),
          child: child!,
        );
      },
    ).then((date){
        setState(() {
          _dateTime = date;
        });

     });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: datePicker,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s4),
        padding: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s8),
        decoration: BoxDecoration(
          color: clr.appWhite,
          border: Border.all(
            color: clr.appBlack,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(size.s8),
        ),
        child: Text(_dateTime==null?widget.hintText: DateFormat.yMMMd().format(_dateTime!).toString(),
          style:_dateTime==null?TextStyle(
            color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: size.textSmall,
        ): TextStyle(
              color: Colors.black,
              fontSize: size.textSmall,
              fontWeight: FontWeight.w600
          ),)
      ),
    );
  }
}
