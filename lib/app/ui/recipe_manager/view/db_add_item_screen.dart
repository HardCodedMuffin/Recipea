import 'package:flutter/material.dart';
import 'package:recipea_app/app/widgets/database/crud/add_item_form.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _summaryFocusNode = FocusNode();
  final FocusNode _ingredientFocusNode = FocusNode();
  final FocusNode _instructionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _summaryFocusNode.unfocus();
        _ingredientFocusNode.unfocus();
        _instructionFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddItemForm(
              titleFocusNode: _titleFocusNode,
              summaryFocusNode: _summaryFocusNode,
              ingredientFocusNode: _ingredientFocusNode,
              instructionFocusNode: _instructionFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
