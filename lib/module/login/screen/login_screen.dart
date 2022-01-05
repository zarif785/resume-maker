import 'package:flutter/material.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/utils/appAssets.dart';


class LoginScreen extends StatefulWidget with AppTheme{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(AppAssets.brandLogo),
          SizedBox(height: 20),
          TextField(
          )
        ],
      ),
    );
  }
}


