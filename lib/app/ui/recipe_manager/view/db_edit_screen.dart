import 'package:flutter/material.dart';
import 'package:recipea_app/app/utils/database.dart';
import 'package:recipea_app/app/widgets/database/crud/db_edit_item_form.dart';

class DbEditScreen extends StatefulWidget {
  final String currentTitle;
  final String currentSummary;
  final String currentIngredient;
  final String currentInstruction;
  final String documentId;

  DbEditScreen({
    required this.currentTitle,
    required this.currentSummary,
    required this.currentIngredient,
    required this.currentInstruction,
    required this.documentId,
  });

  @override
  _DbEditScreenState createState() => _DbEditScreenState();
}

class _DbEditScreenState extends State<DbEditScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _summaryFocusNode = FocusNode();
  final FocusNode _ingredientFocusNode = FocusNode();
  final FocusNode _instructionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _summaryFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: DbEditItemForm(
              documentId: widget.documentId,
              titleFocusNode: _titleFocusNode,
              summaryFocusNode: _summaryFocusNode,
              ingredientFocusNode: _ingredientFocusNode,
              instructionFocusNode: _instructionFocusNode,
              currentTitle: widget.currentTitle,
              currentSummary: widget.currentSummary,
              currentIngredient: widget.currentIngredient,
              currentInstruction: widget.currentInstruction,
            ),
          ),
        ),
      ),
    );
  }
}