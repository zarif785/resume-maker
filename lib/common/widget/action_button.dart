import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/loading_view.dart';

class ActionButton extends StatefulWidget {
  final VoidCallback? onSuccess;
  final String title;
  const ActionButton({Key? key, required this.onSuccess, required this.title}) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> with AppTheme{
  int _stateIndex=0;
  void _onTap(){
    FocusScope.of(context).requestFocus(FocusNode());
    if(mounted){
      _stateIndex=1;
      widget.onSuccess?.call();
      print(_stateIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: Fader(
          index: _stateIndex,
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s4),
              padding: EdgeInsets.symmetric(horizontal: size.s16,vertical: size.s8),
              decoration: BoxDecoration(
                color: clr.appWhite,
                border: Border.all(
                  color: clr.appBlack,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(size.s12),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: clr.appBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: size.textXMedium
                  ),
                ),
              ),
            ),
            Center(
              child: LoadingView(size: size.s24,),
            )
          ],
        ),
      ),
    );
  }
}


class Fader extends StatefulWidget {
  final int index;
  final List<Widget> children;
  const Fader({Key? key, required this.index, required this.children}) : super(key: key);

  @override
  _FaderState createState() => _FaderState();
}

class _FaderState extends State<Fader> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.children.elementAt(widget.index),
    );
  }
}
