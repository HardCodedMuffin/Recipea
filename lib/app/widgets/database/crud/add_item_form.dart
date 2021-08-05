import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/recipe_manager/widgets/image_picker.dart';
import 'package:recipea_app/app/utils/database.dart';
import 'package:recipea_app/app/utils/db_validator.dart';

import '../../custom_form_field.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode summaryFocusNode;
  final FocusNode ingredientFocusNode;
  final FocusNode instructionFocusNode;

  const AddItemForm({
    required this.titleFocusNode,
    required this.summaryFocusNode,
    required this.ingredientFocusNode,
    required this.instructionFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Form(
        key: _addItemFormKey,
        child: Column(
          children: [
            Container(height: 60, child: ImageUpload()),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.0),
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled: false,
                    controller: _titleController,
                    focusNode: widget.titleFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) => DbValidator.validateField(
                      value: value,
                    ),
                    label: 'Title',
                    hint: 'Title: Mother\'s vegetable soup',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Summary',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    maxLines: 10,
                    isLabelEnabled: false,
                    controller: _summaryController,
                    focusNode: widget.summaryFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => DbValidator.validateField(
                      value: value,
                    ),
                    label: 'Summary',
                    hint: 'Any tips, notes?',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    maxLines: 10,
                    isLabelEnabled: false,
                    controller: _ingredientController,
                    focusNode: widget.ingredientFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => DbValidator.validateField(
                      value: value,
                    ),
                    label: 'Ingredients',
                    hint: '250g flour. 100ml water.',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    maxLines: 10,
                    isLabelEnabled: false,
                    controller: _instructionController,
                    focusNode: widget.instructionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) => DbValidator.validateField(
                      value: value,
                    ),
                    label: 'Instructions',
                    hint:
                        'Mix the flour and water until they thicken. Cover the mixture and leave to sit at room temperature 24-36 hours.',
                  ),
                ],
              ),
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.grey,
                      ),
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColorDark,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        widget.titleFocusNode.unfocus();
                        widget.summaryFocusNode.unfocus();
                        widget.ingredientFocusNode.unfocus();
                        widget.instructionFocusNode.unfocus();

                        if (_addItemFormKey.currentState!.validate()) {
                          setState(() {
                            _isProcessing = true;
                          });

                          await Database.addItem(
                            title: _titleController.text,
                            summary: _summaryController.text,
                            ingredient: _ingredientController.text,
                            instruction: _instructionController.text,
                          );

                          setState(() {
                            _isProcessing = false;
                          });
                        }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'package:recipea_app/app/utils/config/theme.dart';
// import 'package:recipea_app/app/utils/database.dart';
// import 'package:recipea_app/app/utils/db_validator.dart';
//
// import '../../custom_form_field.dart';
//
//
// class AddItemForm extends StatefulWidget {
//   final FocusNode titleFocusNode;
//   final FocusNode descriptionFocusNode;
//
//   const AddItemForm({
//     required this.titleFocusNode,
//     required this.descriptionFocusNode,
//   });
//
//   @override
//   _AddItemFormState createState() => _AddItemFormState();
// }
//
// class _AddItemFormState extends State<AddItemForm> {
//   final _addItemFormKey = GlobalKey<FormState>();
//
//   bool _isProcessing = false;
//
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _addItemFormKey,
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
//                   label: 'Description',
//                   hint: 'Enter your note description',
//                 ),
//               ],
//             ),
//           ),
//           _isProcessing
//               ? Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(
//                 Palette.firebaseOrange,
//               ),
//             ),
//           )
//               : Container(
//             width: double.maxFinite,
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(
//                   Palette.firebaseOrange,
//                 ),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               onPressed: () async {
//                 widget.titleFocusNode.unfocus();
//                 widget.descriptionFocusNode.unfocus();
//
//                 if (_addItemFormKey.currentState!.validate()) {
//                   setState(() {
//                     _isProcessing = true;
//                   });
//
//                   await Database.addItem(
//                     title: _titleController.text,
//                     description: _descriptionController.text,
//                   );
//
//                   setState(() {
//                     _isProcessing = false;
//                   });
//
//                 }
//               },
//               child: Padding(
//                 padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
//                 child: Text(
//                   'ADD ITEM',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Palette.firebaseGrey,
//                     letterSpacing: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
