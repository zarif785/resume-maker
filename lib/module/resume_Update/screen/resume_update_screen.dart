import 'package:flutter/material.dart';
import 'package:resume_maker/common/core/app.dart';

class ResumeUpdateScreen extends StatefulWidget {
  const ResumeUpdateScreen({Key? key}) : super(key: key);

  @override
  _ResumeUpdateScreenState createState() => _ResumeUpdateScreenState();
}

class _ResumeUpdateScreenState extends State<ResumeUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(App.currentSession.name),
            Text(App.currentSession.email),
            Text(App.currentSession.contactNo),
            Text(App.currentSession.createdAt),
            Text(App.currentSession.updatedAt),
          ],
        ),
      ),
    );
  }
}
