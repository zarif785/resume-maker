import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/module/login/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AlertBox.dart';

class RoundedAppBar extends StatefulWidget {
  final String title;
  final Widget child;
  final bool? onBack;
  const RoundedAppBar({Key? key, required this.title, required this.child,  this.onBack}) : super(key: key);

  @override
  State<RoundedAppBar> createState() => _RoundedAppBarState();
}

class _RoundedAppBarState extends State<RoundedAppBar> with AppTheme{

  void signOut() {
    showPromptDialog(context: context, description: "Do you really want to logout?",onConfirm: false).then((x) async {
      if(x){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });

}
  Future<bool> onBackPress() {

    return showPromptDialog(
      context: context,
      description:"Do you really want to exit?", onConfirm: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: clr.appBlack,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.s8,horizontal: size.s16),
                  child: GestureDetector(
                    onTap: onBackPress,
                    child: Icon(Icons.arrow_back,size: size.s24,color: clr.appWhite,),

                  ),
                ),
                Expanded(

                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: clr.appWhite,
                        fontSize: size.textLarge,
                      ),
                    ),

                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.s8,horizontal: size.s16),
                  child: GestureDetector(
                    onTap: signOut,
                    child: Icon(Icons.logout,size: size.s24,color: clr.appWhite,),

                  ),
                ),
              ],

            ),
            SizedBox(height: size.s12,),
            Expanded(
              child: Container(

                height: double.infinity,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: clr.appWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  )
                ),
                child: widget.child,
              ),
            )
          ],
        ),
      ),
    );
  }


}
