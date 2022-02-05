import 'package:flutter/material.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/module/resume_Update/service/resume_update_service.dart';

class ResumeUpdateScreen extends StatefulWidget {
  const ResumeUpdateScreen({Key? key}) : super(key: key);

  @override
  _ResumeUpdateScreenState createState() => _ResumeUpdateScreenState();
}

class _ResumeUpdateScreenState extends State<ResumeUpdateScreen> with ResumeUpdateService{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            StreamBuilder<PageState>(
              initialData: LoadingState(),
              stream: accountsInfoStream,
              builder: (context,snapshot){
                var data = snapshot.data;
                if(data is DataLoadedState){
                  return Column(
                    children: [
                      Text(data.data.name!),
                      Text(data.data.email!),

                      Text(data.data.contactNo!),
                      Text(data.data.address!),

                    ],
                  );
                }
                else{
                  return GestureDetector(
                    onTap: getAccountsDetails,
                    child:Container(
                      height: 200,
                      width: 200,
                        color: Colors.red,
                        child: Text('Click Here'))
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
