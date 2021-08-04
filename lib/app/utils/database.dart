import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipea_app/app/ui/recipe_manager/view/db_add_item_form.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String title,
    required String description,
    required DynamicList ingredientList,
    required DynamicList instructionList,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "ingredients": ingredientList,
      "steps": instructionList,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Recipe added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
    required DynamicList ingredientList,
    required DynamicList instructionList,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
      "ingredients": ingredientList,
      "steps": instructionList,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Recipe updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Recipe deleted from the database'))
        .catchError((e) => print(e));
  }
}
