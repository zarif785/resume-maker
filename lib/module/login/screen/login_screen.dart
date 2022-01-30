
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/utils/appAssets.dart';
import 'package:resume_maker/common/widget/action_button.dart';
import 'package:resume_maker/common/widget/textField.dart';
import 'package:resume_maker/module/login/service/login_screen_service.dart';

import '../../../app_route.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AppTheme,LoginScreenService{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // resizeToAvoidBottomInset: false,
      backgroundColor: clr.appBlack,
      body: Container(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: AspectRatio(
          aspectRatio: 3,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: 30),
                Image.asset(AppAssets.brandLogo,height:350.h,width: 350.w,),
                SizedBox(height: size.s16),
                Text(
                  "LOGIN HERE",
                  style: TextStyle(
                    fontSize: size.textSmall,
                    fontWeight: FontWeight.w800,
                    color: clr.appWhite,
                  ),
                ),
                SizedBox(height: size.s16),
                TextFieldWidget(controller: emailController, hintText: "Enter Email", type: 'email'),
                SizedBox(height: size.s8),
                TextFieldWidget(controller: passwordController, hintText: "Enter Password", type: 'password'),
                SizedBox(height: size.s12),
                ActionButton(  title: "Login",
                  onCheck:()=> validateLoginFormData(emailController,passwordController),
                  tapAction:()=> doLogIn(emailController,passwordController),
                  onSuccess: onLoginSuccess,),
                SizedBox(height: size.s42),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: size.textXXSmall,
                        fontWeight: FontWeight.w400,
                        color: clr.appWhite,
                      ),
                    ),
                    SizedBox(width: size.s12),
                    GestureDetector(
                      onTap: onRegisterPress,
                      child: Text('Register',
                        style: TextStyle(
                        fontSize: size.textSmall,
                        fontWeight: FontWeight.w800,
                        color: clr.appWhite,
                          decoration: TextDecoration.underline,
                      ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void navigateToHomeScreen() {
    Navigator.of(context).pushNamed(AppRoute.homeScreen);
  }

  @override
  void navigateToRegisterScreen() {
    Navigator.of(context).pushNamed(AppRoute.registerScreen);
  }

  @override
  void showWarning(String message) {
    Toasty.of(context).showWarning(message);
  }
}


