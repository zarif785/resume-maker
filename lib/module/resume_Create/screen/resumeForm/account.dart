

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';

class Account extends StatefulWidget {

  // final FormContentModel model;
  final AccountsModel model;
  const Account( {Key? key, required this.model,}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with AppTheme, AutomaticKeepAliveClientMixin{

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController  = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();


  @override
  void initState() {
    usernameController.text = widget.model.name;
    addressController.text = widget.model.address;
    emailController.text = App.currentSession.email;
    mobileNoController.text = widget.model.contactNo;

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
                children: [
                  TextFieldWidget(hintText: 'Name', type: 'name',initialValue:widget.model.name,onTextChanged: (x){widget.model.name = x;}
                  ),
                  TextFieldWidget(hintText: 'Number', type: 'number',initialValue:widget.model.contactNo,onTextChanged: (x){widget.model.contactNo = x;}),
                  TextFieldWidget(hintText: 'Email', type: 'email',initialValue:widget.model.email,onTextChanged: (x){widget.model.email = x;}),
                  MultiLineTextFieldWidget(hintText: "Address", type: 'address',onTextChanged: (x){widget.model.address = x;},initialValue:widget.model.address),
                  // CircularButton(onTap: onChange, icon: Icons.save),
                  // SizedBox(height: size.s24,),



                ],
              ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
// List<MapEntry<String,String>> x = [
//   MapEntry(
//     "What is Smart English Writing (SEW)?",
//     "Smart English Writing (SEW) is an English writing improvement service of BacBon Tutors. ",
//   ),
//   MapEntry(
//     "Why SEW Service?",
//     "To make English learning enjoyable to learners and remove the not good at English mindset of learners.",
//   ),  MapEntry(
//     "Who can participate in SEW?",
//     "All learners who want to improve their English writing skills through customized feedback, especially university admission candidates, students from grade ten to tertiary level, job holders/candidates, GRE or IELTS candidates, and so on.",
//   ),  MapEntry(
//     "How long does a learner need to wait to get service feedback?",
//     " Minimum 10 minutes to 48 hours after his/her submission.",
//   ),  MapEntry(
//     " When shall I complain if I do not get corrections and feedback on my submission(s)?",
//     " Immediately, after 48 hours ",
//   ),  MapEntry(
//     "What will I get in the service?",
//     " Correction of your writing, personalized feedback on grammar, and other writing issues.",
//   ),  MapEntry(
//     "How many correctors do we have currently",
//     "150+",
//   ),  MapEntry(
//     " What is the qualification of the correctors?",
//     "Current university students, college teachers, and professional English Proof writers.",
//   ),  MapEntry(
//     " Can I see who my corrector is?",
//     " No, but you can check their profile on our website.",
//   ),  MapEntry(
//     "Can I contact my Correctors?",
//     "Yes, you can. If necessary, we will connect you.",
//   ),  MapEntry(
//     " Can I claim the refund?",
//     "Yes, you can if you do not get corrections and feedback on your submissions.",
//   ),  MapEntry(
//     " Is it mandatory to buy a package, or is customization available?",
//     " It is not mandatory; customization is possible based on the requirements. ",
//   ),  MapEntry(
//     " Is there any time limitation for submission after purchase?",
//     "Maximum 03 (three) months or package lifetime.",
//   ),  MapEntry(
//     " Does SEW provide service to Educational Institutions?",
//     "Yes, all educational or professional businesses can take this service.",
//   ),  MapEntry(
//     " Can I buy multiple packages?",
//     "Yes",
//   ),  MapEntry(
//     "What is the payment mode?",
//     "Pay per package",
//   ),  MapEntry(
//     "When do I need to make payment?",
//     "You have to pay in advance and get service.",
//   ),MapEntry(
//     "Is it mandatory to have Computer to get the service?",
//     "No, you can use the service from your smartphone, Tablets, and computers.",
//   ),MapEntry(
//     "What platforms are used for the SEW service?",
//     "You can use both the BacBon Tutors App and Website to write and submit your writing.",
//   ),MapEntry(
//     "Can I submit an image or PDF file of my handwriting for correction?",
//     "No, you need to type and submit.",
//   ),MapEntry(
//     "What are the payment methods?",
//     "Internal payment gateway (bKash, Rocket, Nagad, Debit/Credit Cards)",
//   ),MapEntry(
//     "Can I give feedback to my Correctors? ",
//     "Yes, you can rate them out of the 05 scales.",
//   ),MapEntry(
//     "Can I know my level of progress?",
//     "Yes, you will get the mark of each submission and track your progress in writing.",
//   ),MapEntry(
//     " Will I get any certificate after completion of my course?",
//     "Currently, not available, this feature is under consideration.",
//   ),MapEntry(
//     "Will I get any working opportunities after improving my skill?",
//     "Yes, we have a similar service for Japanese Students; you can join that service or SEW service through passing qualifications exams.",
//   ),MapEntry(
//     "How to submit any complaint?",
//     "Through Internal chat box/email/direct call/Messenger group/service user forum etc",
//   ),
// ];