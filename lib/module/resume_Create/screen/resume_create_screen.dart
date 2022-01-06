import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/theme/appTheme.dart';

class ResumeCreateScreen extends StatefulWidget {
  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{
  int currentStep = 0;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Create Resume',
            style: TextStyle(
              color: Colors.black,
                fontSize: size.textLarge,
                fontWeight: FontWeight.w800
            ),
          ),
        ),
          body: Container(

            child: Stepper(

                type: StepperType.horizontal,
                steps: getSteps(),
                onStepContinue: (){
                  bool isLastStep = currentStep==getSteps().length-1;
                  if(isLastStep){
                    print("Complete");
                  }
                  else{
                    setState(() {
                      currentStep +=1;
                    });
                  }

                },
              onStepCancel: currentStep==0? null:(){
                setState(() {
                  currentStep -=1;
                });
              },
            ),
          ),
      ),
    );

  }

  List<Step> getSteps() =>[

      Step(
        state: currentStep > 0?StepState.complete:StepState.indexed,
        isActive: currentStep >=0,
       title:Text("Account"),
       content: Container(
        child: Column(
           children: [
           ],
         )
       )),
    Step(
        state: currentStep > 1?StepState.complete:StepState.indexed,
        isActive: currentStep >= 1,
        title:Text("Address"),
        content: Container()),
    Step(
        state: currentStep > 2?StepState.complete:StepState.indexed,
        isActive: currentStep>=2,
        title:Text("Complete"),
        content: Container()),
  ];

}