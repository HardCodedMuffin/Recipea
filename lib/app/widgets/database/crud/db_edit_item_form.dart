// import 'package:flutter/material.dart';
//
// import 'package:recipea_app/app/utils/config/theme.dart';
// import 'package:recipea_app/app/utils/database.dart';
// import 'package:recipea_app/app/utils/db_validator.dart';
//
// import '../../custom_form_field.dart';
//
// class DbEditItemForm extends StatefulWidget {
//   final FocusNode titleFocusNode;
//   final FocusNode descriptionFocusNode;
//   final String currentTitle;
//   final String currentDescription;
//   final String documentId;
//
//   const DbEditItemForm({
//     required this.titleFocusNode,
//     required this.descriptionFocusNode,
//     required this.currentTitle,
//     required this.currentDescription,
//     required this.documentId,
//   });
//
//   @override
//   _DbEditItemFormState createState() => _DbEditItemFormState();
// }
//
// class _DbEditItemFormState extends State<DbEditItemForm> {
//   final _editItemFormKey = GlobalKey<FormState>();
//
//   bool _isProcessing = false;
//
//   late TextEditingController _titleController;
//   late TextEditingController _descriptionController;
//
//   @override
//   void initState() {
//     _titleController = TextEditingController(
//       text: widget.currentTitle,
//     );
//
//     _descriptionController = TextEditingController(
//       text: widget.currentDescription,
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _editItemFormKey,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 8.0,
//               right: 8.0,
//               bottom: 24.0,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 24.0),
//                 Text(
//                   'Title',
//                   style: TextStyle(
//                     color: Palette.firebaseGrey,
//                     fontSize: 22.0,
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 CustomFormField(
//                   isLabelEnabled: false,
//                   controller: _titleController,
//                   focusNode: widget.titleFocusNode,
//                   keyboardType: TextInputType.text,
//                   inputAction: TextInputAction.next,
//                   validator: (value) => DbValidator.validateField(
//                     value: value,
//                   ),
//                   fillColor: Theme.of(context).scaffoldBackgroundColor,
//                   label: 'Title',
//                   hint: 'Enter your note title',
//                 ),
//                 SizedBox(height: 24.0),
//                 Text(
//                   'Description',
//                   style: TextStyle(
//                     color: Palette.firebaseGrey,
//                     fontSize: 22.0,
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 CustomFormField(
//                   maxLines: 10,
//                   isLabelEnabled: false,
//                   controller: _descriptionController,
//                   focusNode: widget.descriptionFocusNode,
//                   keyboardType: TextInputType.text,
//                   inputAction: TextInputAction.done,
//                   validator: (value) => DbValidator.validateField(
//                     value: value,
//                   ),
//                   fillColor: Theme.of(context).scaffoldBackgroundColor,
//                   label: 'Description',
//                   hint: 'Enter your note description',
//                 ),
//               ],
//             ),
//           ),
//           _isProcessing
//               ? Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       Palette.firebaseOrange,
//                     ),
//                   ),
//                 )
//               : Container(
//                   width: double.maxFinite,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                         Palette.firebaseOrange,
//                       ),
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     onPressed: () async {
//                       widget.titleFocusNode.unfocus();
//                       widget.descriptionFocusNode.unfocus();
//
//                       if (_editItemFormKey.currentState!.validate()) {
//                         setState(() {
//                           _isProcessing = true;
//                         });
//
//                         await Database.updateItem(
//                           docId: widget.documentId,
//                           title: _titleController.text,
//                           description: _descriptionController.text,
//                         );
//
//                         setState(() {
//                           _isProcessing = false;
//                         });
//
//                         Navigator.of(context).pop();
//                       }
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
//                       child: Text(
//                         'UPDATE ITEM',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Palette.firebaseGrey,
//                           letterSpacing: 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }
