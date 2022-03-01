//
// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:captain_bonik/common/core/app.dart';
// import 'package:captain_bonik/common/styles/app_theme.dart';
// import 'package:captain_bonik/common/widgets/toasty.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/services.dart';
//
// class ImagePickerWidget extends StatefulWidget {
//   final Function(File file)? onRemove;
//   final Function(File file)? onPicked;
//   final File? file;
//
//   const ImagePickerWidget({ Key? key,  this.onRemove,  this.onPicked,  this.file})
//       : super(key: key);
//   @override
//   ImagePickerWidgetState createState() => ImagePickerWidgetState();
// }
//
// class _ImagePickerWidgetState extends State<ImagePickerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _showImagePicker,
//       child: widget.file == null ? buildNoImageWidget() : buildImageWidget(),
//     );
//   }
//
//   Container _buildNoImageWidget() {
//     return Container(
//       height: 78,
//       width: 74,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Icon(
//         Icons.add_photo_alternate,
//         size: 42,
//         color: Colors.black87,
//       ),
//     );
//   }
//
//   Container _buildImageWidget() {
//     return Container(
//       height: 86,
//       width: 74,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.file(
//                 widget.file!,
//                 fit: BoxFit.cover,
//               )),
//           Align(
//             alignment: Alignment.topRight,
//             child: GestureDetector(
//               onTap: _removeImage,
//               child: Container(
//                 padding: EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Icon(
//                   Icons.close,
//                   color: Colors.redAccent,
//                   size: 22,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showImagePicker() {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return BottomSheetImagePicker(
//           onCamera: () => _onOptionSelected(ImageSource.camera),
//           onGallery: () => _onOptionSelected(ImageSource.gallery),
//         );
//       },
//     );
//   }
//
//   _onOptionSelected(ImageSource source) async {
//     Navigator.of(context).pop();
//     try {
//       var image =
//       await ImagePicker().getImage(source: source, imageQuality: 80);
//       if (image != null) {
//         widget.onPicked?.call(File(image.path));
//       }
//     } catch (_) {
//       Toasty.of(context).showError(message: 'Failed to pick image!');
//     }
//   }
//
//   void _removeImage() {
//     widget.onRemove?.call(widget.file!);
//   }
// }
//
// class ImageThumbWidget extends StatefulWidget {
//   final Function(int index) onRemove;
//   final int index;
//   final String path;
//
//   const ImageThumbWidget(
//       {required Key key, required this.onRemove, required this.path, required this.index})
//       : super(key: key);
//   @override
//   ImageThumbWidgetState createState() => ImageThumbWidgetState();
// }
//
// class _ImageThumbWidgetState extends State<ImageThumbWidget> with App {
//   final StreamController<Uint8List?> _streamController = StreamController();
//   @override
//   void initState() {
//     super.initState();
//     _compressImage();
//   }
//
//   @override
//   void dispose() {
//     _streamController.close();
//     super.dispose();
//   }
//
//   _compressImage() async {
//     if (widget.path.trim().isNotEmpty) {
//       if (!_streamController.isClosed) {
//         _streamController.sink.add(null);
//       }
//       Uint8List originalUnit8List = File(widget.path).readAsBytesSync();
//       // var codec = await ui.instantiateImageCodec(originalUnit8List,
//       //     targetHeight: (screen!.devicePixelRatio * 86).toInt(),
//       //     targetWidth: (screen!.devicePixelRatio * 74).toInt());
//       // var frameInfo = await codec.getNextFrame();
//       // ui.Image targetUiImage = frameInfo.image;
//       // ByteData? targetByteData =
//       // await targetUiImage.toByteData(format: ui.ImageByteFormat.png);
//       if (!_streamController.isClosed ) {
//         _streamController.sink.add(originalUnit8List);
//       }
//     }
//   }
//
//   @override
//   void didUpdateWidget(covariant ImageThumbWidget oldWidget) {
//     if (oldWidget.path != widget.path) {
//       _compressImage();
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 86,
//       width: 74,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: StreamBuilder<Uint8List?>(
//                 stream: _streamController.stream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Image.memory(
//                       snapshot.data!,
//                       fit: BoxFit.cover,
//                     );
//                   } else
//                     return Center(
//                       child: SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(Colors.grey),
//                           strokeWidth: 2,
//                         ),
//                       ),
//                     );
//                 }),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: GestureDetector(
//               onTap: _removeImage,
//               child: Container(
//                 padding: EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Icon(
//                   Icons.close,
//                   color: Colors.redAccent,
//                   size: 22,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _removeImage() {
//     widget.onRemove.call(widget.index);
//   }
// }
//
// class BottomSheetImagePicker extends StatefulWidget {
//   final VoidCallback onCamera, onGallery;
//   const BottomSheetImagePicker(
//       { Key? key, required this.onCamera, required this.onGallery})
//       : super(key: key);
//
//   @override
//   BottomSheetImagePickerState createState() => BottomSheetImagePickerState();
// }
//
// class _BottomSheetImagePickerState extends State<BottomSheetImagePicker>
//     with AppTheme {
//   int selected = 0;
//   bool _tapped = false;
//   void _onSelect(int index) {
//     if (!_tapped) {
//       _tapped = true;
//       setState(() {
//         selected = index;
//       });
//
//       Future.delayed(const Duration(milliseconds: 250)).then((x) {
//         if (index == 1) {
//           widget.onCamera();
//         } else if (index == 2) {
//           widget.onGallery();
//         }
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: size.s32, vertical: size.s24),
//         decoration: BoxDecoration(
//             color: clr.controlBgWhite,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(size.s42),
//               topLeft: Radius.circular(size.s42),
//             )),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Icon(
//                   Icons.camera,
//                   size: size.s24,
//                 ),
//                 SizedBox(
//                   width: size.s4,
//                 ),
//                 Text(
//                   "Pick image from",
//                   style: TextStyle(color: clr.textBlackLight,fontSize: size.textMedium),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: size.s24,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () => _onSelect(1),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 150),
//                     padding: EdgeInsets.symmetric(vertical: size.s16, horizontal: size.s16),
//                     decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.circular(size.s16),
//                         border: Border.all(
//                             color:
//                             selected == 1 ?clr.primaryAppColor : clr.textBlackLight,
//                             width: 1.2)),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Icon(
//                           Icons.photo_camera,
//                           color: selected == 1 ? clr.primaryAppColor : clr.textBlackLight,
//                           size: size.s32,
//                         ),
//                         const SizedBox(
//                           height: 2,
//                         ),
//                         Text("Camera",
//                             style: TextStyle(
//                                 fontSize: size.textXMedium,
//                                 color: selected == 1
//                                     ? clr.primaryAppColor
//                                     : clr.textBlackLight)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Text("or",
//                     style: TextStyle(fontSize: size.textXMedium, color: clr.textBlackLight)),
//                 GestureDetector(
//                   onTap: () => _onSelect(2),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 150),
//                     padding: EdgeInsets.symmetric(vertical: size.s16, horizontal: size.s16),
//                     decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.circular(size.s16),
//                         border: Border.all(
//                             color:
//                             selected == 2 ? clr.primaryAppColor : clr.textBlackLight,
//                             width: 1.2)),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Icon(
//                           Icons.image,
//                           color: selected == 2 ?clr.primaryAppColor : clr.textBlackLight,
//                           size: size.s32,
//                         ),
//                         SizedBox(
//                           height: size.s4,
//                         ),
//                         Text("Gallery",
//                             style: TextStyle(
//                                 fontSize: size.textXMedium,
//                                 color: selected == 2
//                                     ? clr.primaryAppColor
//                                     : clr.textBlackLight)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }