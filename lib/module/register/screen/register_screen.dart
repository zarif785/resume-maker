import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/UserSession.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
import 'package:resume_maker/common/utils/appAssets.dart';
import 'package:resume_maker/common/widget/action_button.dart';
import 'package:resume_maker/common/widget/loginTextField.dart';
import 'package:resume_maker/common/widget/textField.dart';
import 'package:resume_maker/module/register/service/register_screen_service.dart';

import '../../../app_route.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with AppTheme,RegisterScreenService{
  UserSession model =UserSession.empty();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstnameController.text=model.name;

  }

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
                Image.asset(AppAssets.brandLogo,height:300.h,width: 300.w,),
                SizedBox(height: size.s16),
                Text(
                  "REGISTER HERE",
                  style: TextStyle(
                    fontSize: size.textSmall,
                    fontWeight: FontWeight.w800,
                    color: clr.appWhite,
                  ),
                ),
                SizedBox(height: size.s16),
                LoginTextFieldWidget(controller: firstnameController, hintText: "Enter  Name", type: 'name',),
                SizedBox(height: size.s4),
                // TextFieldWidget(controller: lastnameController, hintText: "Enter Last Name", type: 'name'),
                // SizedBox(height: size.s4),
                LoginTextFieldWidget(controller: emailController, hintText: "Enter Email", type: 'email',),
                SizedBox(height: size.s4),
                LoginTextFieldWidget(controller: passwordController, hintText: "Enter Password", type: 'password'),
                SizedBox(height: size.s4),
                LoginTextFieldWidget(controller: confirmpasswordController, hintText: "Confirm Password", type: 'password'),
                SizedBox(height: size.s12),
                // ActionButton(onSuccess: onRegisterButtonPress, title: "Register"),
                ActionButton(  title: "Register",
                  onCheck:()=> validateRegisterFormData(firstnameController,emailController,passwordController,confirmpasswordController),
                  tapAction:()=> doSignUp(firstnameController,emailController,passwordController,confirmpasswordController),
                  onSuccess: onRegisterSuccess,),

                SizedBox(height: size.s32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: size.textXXSmall,
                        fontWeight: FontWeight.w400,
                        color: clr.appWhite,
                      ),
                    ),
                    SizedBox(width: size.s12,),
                    GestureDetector(
                      onTap: onLoginPress,
                      child: Text('Login',
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
  void navigateToLoginScreen() {
    Navigator.of(context).pushNamed(AppRoute.loginScreen);
  }

  @override
  void showWarning(String s) {
    Toasty.of(context).showWarning(s);
  }
}
