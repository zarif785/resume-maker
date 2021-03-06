///Name: Md. Abdur Rouf
///Email: official.rouf69nb@gmail.com
///Created at: Dec 28,, 2021


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

typedef WidgetBuilder = Widget Function(BuildContext context, int index);

class ActionButton<T> extends StatefulWidget {
  final String title;
  final Future<ActionResult<T>> Function() tapAction;
  final bool Function()? onCheck;
  final void Function(T data) onSuccess;
  final DefaultActionButtonController? controller;
  final bool enabled;

  const ActionButton({
    Key? key,
    required this.title,
    required this.tapAction,
    required this.onSuccess,
    this.onCheck,
    this.controller,
    this.enabled=true,
  }) : super(key: key);


  @override
  _ActionButtonState<T> createState() => _ActionButtonState<T>();
}
class _ActionButtonState<T> extends State<ActionButton<T>> with AppTheme{
  late Color _buttonTextColor;
  late bool _expanded;
  late int _stateIndex;


  @override
  void initState() {
    _expanded = true;
    _stateIndex = 0;
    _buttonTextColor = clr.appBlack;
    super.initState();
    if(widget.controller != null) widget.controller?._setAutoTapEventHandler(_onTap);
    if(widget.controller != null) widget.controller?._setForceTapEventHandler(_executeRequest);
  }

  void _onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    if( mounted && _stateIndex == 0 && widget.enabled)
    {
      if(widget.onCheck == null || widget.onCheck!()) {
        _executeRequest();
      }
    }
  }

  void _executeRequest() {
    // // set state to working
    if(mounted) {
      setState(() {
        _expanded = false;
        _stateIndex = 1;
      });
    }

    _lockUi();
    widget.tapAction().then((x) {
      // set state to success
      if(mounted) {
        setState(() {
          try{
            if(x.isSuccess == true) {
              _stateIndex = 2;
              Future.delayed(const Duration(milliseconds: 700)).whenComplete((){
                if(mounted) widget.onSuccess.call(x.data!);
              });
            }else{
              _stateIndex = 3;
            }
          }catch(e){
            _stateIndex = 3;
          }
        });
      }
    }).catchError((x) {
      // set state to error
      if(mounted) {
        setState(() {
          _stateIndex = 3;
        });
      }
    }).whenComplete(() {
      // reset state to normal
      _unlockUi();
      Future.delayed(const Duration(milliseconds: 1200)).then((x) {
        if(mounted) {
          setState(() {
            _expanded = true;
            _stateIndex = 0;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          height: 40.w,
          width: _expanded?MediaQuery.of(context).size.width-35:40.w,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: clr.appWhite,
            borderRadius: BorderRadius.circular(_expanded?size.s12:100),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: Fader(
              index: _stateIndex,
              children: <Widget>[
                // title text
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: _buttonTextColor,
                    wordSpacing: 2,
                    letterSpacing: 3,
                  ),
                ),

                // progressbar
                SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child:
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(_buttonTextColor),
                    strokeWidth: 2.w,
                  ),
                ),

                // Success icon
                Icon(Icons.check, color: _buttonTextColor,size: 24.w),

                // Error icon
                Icon(Icons.close, color: _buttonTextColor,size: 24.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isUiLocked = false;
  void _lockUi() async {
    if(!_isUiLocked) {
      _isUiLocked = true;
      await showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(.07),
          builder: (x) {
            return Material(
              type: MaterialType.transparency,
              child: WillPopScope(
                onWillPop: () async => false,
                child: Container(),
              ),
            );
          }
      );
      _isUiLocked = false;
    }
  }
  void _unlockUi() {
    if(_isUiLocked){
      Navigator.of(context).pop();
    }
  }

}
class DefaultActionButtonController{
  VoidCallback? _autoTapEvent;
  VoidCallback? _forceTapEvent;
  void _setAutoTapEventHandler(VoidCallback event)
  {
    _autoTapEvent = event;
  }
  void _setForceTapEventHandler(VoidCallback event)
  {
    _forceTapEvent = event;
  }

  void tap(){
    if(_autoTapEvent != null) {
      _autoTapEvent!();
    }
  }
  void forceTap(){
    _forceTapEvent?.call();
  }
}


// Fader
class Fader extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const Fader({Key? key,required this.index,required this.children}) : super(key: key);

  @override
  _FaderState createState() => _FaderState();
}
class _FaderState extends State<Fader> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Widget _widget;

  @override
  void initState() {
    _widget = widget.children.elementAt(widget.index);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCubic));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Fader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _animationController.forward().then((x) {
        // set new widget
        _widget = widget.children.elementAt(widget.index);
      }).then((x) {
        _animationController.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: _widget,
        );
      },
    );
  }
}