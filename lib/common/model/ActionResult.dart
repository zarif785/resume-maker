import 'package:resume_maker/common/core/server.dart';

///Name: Md. Abdur Rouf
///Email: official.rouf69nb@gmail.com
///Created at: Dec 28, 2021


class ActionResult<T>{
  late bool isSuccess;
  late String message;
  late T? data;
  ActionResult({required this.isSuccess,required this.message, this.data});

  ActionResult.fromServerResponse({required ServerResponse response,required T Function(dynamic data) generateData}){
    this.isSuccess = response.success;
    this.message = response.message;
    this.data = isSuccess ? generateData(response.data):null;
  }


  // ActionResult.error({String msg = "Request failed! Unknown error occurred."}){
  //   status = Status.error;
  //   message = msg;
  // }
}

// enum Status{
//   success,
//   warning,
//   error,
//   empty,
// }
// extension _StatusExtensionMap on Status {
//   static const _valueMap = {
//     Status.error : false,
//     Status.success : 1,
//     Status.warning : 2,
//     Status.empty : 3,
//   };
//
//   int get value => _valueMap[this]??false;
//   static Status state(int value) => _valueMap.keys.firstWhere((element) => element.value == value, orElse: ()=> Status.error);
// }