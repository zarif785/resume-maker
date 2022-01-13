import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';
import 'package:resume_maker/common/widget/textField.dart';

class ResumeCreateScreen extends StatefulWidget {
  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedAppBar(
        onBack: true,
        title: 'Create Resume',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              UserCreds(),
            ],
          ),
        )
      )

    );

  }


}
class LinearContainer extends StatelessWidget with AppTheme{
  const LinearContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.w),
      height: size.s42,
      width: 3.w,
      color: Colors.black,
    );
  }
}

class UserCreds extends StatefulWidget {
  const UserCreds({Key? key}) : super(key: key);

  @override
  _UserCredsState createState() => _UserCredsState();
}

class _UserCredsState extends State<UserCreds> with AppTheme{
  TextEditingController usernameController = TextEditingController();
  bool _isShowing= false;
  void _toggleViewer() {
    setState(() {
      _isShowing = !_isShowing;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleViewer,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50.r),

                  ),
                  child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.person,color: Colors.white,),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: size.s12),
                    padding: EdgeInsets.symmetric(vertical: size.s12,),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Text(
                        "Account",
                        style: TextStyle(
                          // color:widget.service.currentChapterId == widget.chapter.id ?Colors.orange:Colors.black.withOpacity(.7),
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.s8),
                  child: Icon(_isShowing?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, size: 26, color: Colors.grey.withOpacity(.9),),
                ),
              ],

            ),
          ),
          _isShowing?Container(
            child: Column(
              children: [
                TextFieldWidget(hintText: 'Name', type: 'name', controller: usernameController,),
                TextFieldWidget(hintText: 'Number', type: 'number', controller: usernameController,),
                TextFieldWidget(hintText: 'Email', type: 'email', controller: usernameController,),

                SizedBox(height: size.s24,),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50.r),

                  ),
                  child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.person,color: Colors.white,)),
                ),
              ],
            ),
          ):Offstage(),
          Container(
            height: 1.2,
            width: MediaQuery.of(context).size.width -100,
            color: Colors.grey.withOpacity(.25),
          ),

          // Divider(thickness: 3,indent: 30,endIndent: 30,)
        ],
      ),
    );
  }
}
