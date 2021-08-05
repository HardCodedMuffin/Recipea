import 'package:flutter/material.dart';
import 'package:recipea_app/app/utils/database.dart';
import 'package:recipea_app/app/utils/db_validator.dart';

import '../../custom_form_field.dart';

class DbEditItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode summaryFocusNode;
  final FocusNode ingredientFocusNode;
  final FocusNode instructionFocusNode;
  final String currentTitle;
  final String currentSummary;
  final String currentIngredient;
  final String currentInstruction;
  final String documentId;

  const DbEditItemForm({
    required this.titleFocusNode,
    required this.summaryFocusNode,
    required this.ingredientFocusNode,
    required this.instructionFocusNode,
    required this.currentTitle,
    required this.currentSummary,
    required this.currentIngredient,
    required this.currentInstruction,
    required this.documentId,
  });

  @override
  _DbEditItemFormState createState() => _DbEditItemFormState();
}

class _DbEditItemFormState extends State<DbEditItemForm> {
  final _editItemFormState = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _ingredientController;
  late TextEditingController _instructionController;

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.currentTitle,
    );

    _summaryController = TextEditingController(
      text: widget.currentSummary,
    );

    _ingredientController = TextEditingController(
      text: widget.currentSummary,
    );

    _instructionController = TextEditingController(
      text: widget.currentSummary,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Form(
        key: _editItemFormState,
        child: Column(
          children: [
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
                    hint: 'Mix the flour and water until they thicken. Cover the mixture and leave to sit at room temperature 24-36 hours.',
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

                  if (_editItemFormState.currentState!.validate()) {
                    setState(() {
                      _isProcessing = true;
                    });

                    await Database.updateItem(
                      docId: widget.documentId,
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
                  'Edit',
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
