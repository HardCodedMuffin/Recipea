import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipea_app/app/ui/recipe_manager/widgets/custom_form_field.dart';
import 'package:recipea_app/app/utils/database.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListProvider>(
        create: (context) => ListProvider(), child: AddRecipeView());
  }
}

class AddRecipeView extends StatefulWidget {
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  late GlobalKey<FormState> _formKey;
  late GlobalKey<FormState> _ingredientsListFormKey;
  late GlobalKey<FormState> _instructionsListFormKey;
  late TextEditingController _ingredientsListController;
  late TextEditingController _instructionsListController;
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late ScrollController _scrollController;
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode summaryFocusNode = FocusNode();
  final FocusNode ingredientFocusNode = FocusNode();
  final FocusNode instructionsFocusNode = FocusNode();
  late var instructions;
  late var ingredients;
  int ingCounter = 0;
  int insCounter = 0;
  bool _isProcessing = false;
  late DynamicList ingredientList;
  late DynamicList instructionList;

  @override
  void initState() {
    _formKey = GlobalKey();
    _instructionsListFormKey = GlobalKey();
    _ingredientsListFormKey = GlobalKey();
    _ingredientsListController = TextEditingController();
    _instructionsListController = TextEditingController();
    _titleController = TextEditingController();
    _summaryController = TextEditingController();
    _scrollController = ScrollController();
    ingredients = Provider.of<ListProvider>(context, listen: false);
    instructions = Provider.of<ListProvider>(context, listen: false);
    ingredientList = DynamicList(ingredients.list);
    instructionList = DynamicList(instructions.list);
    super.initState();
  }

  @override
  void dispose() {
    _ingredientsListController.dispose();
    _titleController.dispose();
    _summaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: _isProcessing
            ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColorDark),
            )
            : Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).scaffoldBackgroundColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    titleFocusNode.unfocus();
                    summaryFocusNode.unfocus();

                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isProcessing = true;
                      });

                      await Database.addItem(
                        title: _titleController.text,
                        description: _summaryController.text,
                        ingredientList: ingredientList,
                        instructionList: instructionList,
                      );

                      setState(() {
                        _isProcessing = false;
                      });

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomFormField(
                          controller: _titleController,
                          isLabelEnabled: false,
                          focusNode: titleFocusNode,
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (val) {
                            if (val.length > 0) {
                              return null;
                            } else
                              return 'Ups.. don\'t you made up your mind yet :/';
                          },
                          label: 'Title',
                          hint: 'How you want to call?',
                          onSaved: (val) {},
                        ),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomFormField(
                          controller: _summaryController,
                          isLabelEnabled: false,
                          focusNode: summaryFocusNode,
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          validator: (val) {
                            if (val.length > 0) {
                              return null;
                            } else
                              return 'Ups.. don\'t you made up your mind yet :/';
                          },
                          label: 'Summary',
                          hint: 'Any tips, notes for the recipe?',
                          onSaved: (val) {},
                        ),
                      ),
                    ],
                  ),
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
                buildDynamicList(
                    context,
                    ingredientList,
                    ingredients,
                    _ingredientsListFormKey,
                    _ingredientsListController,
                    ingredientFocusNode,
                    'Ingredients',
                    '250g flour',
                    'Add an Ingredient',
                    buildListIngredient),
                Text(
                  'Steps',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                buildDynamicList(
                    context,
                    instructionList,
                    instructions,
                    _instructionsListFormKey,
                    _instructionsListController,
                    instructionsFocusNode,
                    'Instructions',
                    'Mix flour and water until they thicken',
                    'Add an Instruction',
                    buildListInstruction),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDynamicList(BuildContext context, list, item, key, controller,
      focusNode, String label, String hint, String errorMsg, build) {
    return SizedBox(
      height: list.list!.length.toDouble() + 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
            child: Form(
              key: key,
              child: CustomFormField(
                controller: controller,
                isLabelEnabled: false,
                focusNode: focusNode,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.next,
                label: label,
                hint: hint,
                onSaved: (val) {
                  item.addItem(val);
                },
                validator: (val) {
                  if (val.length > 0) {
                    return null;
                  } else
                    return errorMsg;
                },
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {
              if (key.currentState!.validate()) {
                key.currentState!.save();
              }
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: Text(label),
          ),
          Consumer<ListProvider>(builder: (context, provider, listTile) {
            return Expanded(
              child: ListView.builder(
                itemCount: list.list!.length,
                itemBuilder: build,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildListIngredient(BuildContext context, int index) {
    ingCounter++;
    return Dismissible(
        key: Key(ingCounter.toString()),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          ingredients.deleteItem(index);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(ingredientList.list![index].toString()),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ));
  }

  Widget buildListInstruction(BuildContext context, int index) {
    insCounter++;
    return Dismissible(
        key: Key(insCounter.toString()),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          instructions.deleteItem(index);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(instructionList.list![index].toString()),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ));
  }
}

class ListProvider with ChangeNotifier {
  List<String> list = [];

  void addItem(String item) {
    list.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}

class DynamicList {
  List<String>? _list = [];

  DynamicList(this._list);

  List? get list => _list;
}
