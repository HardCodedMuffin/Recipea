import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('cookbook');

class Database {
  static String? userUid;

  static Future<void> addItem({
    required String title,
    required String summary,
    required String ingredient,
    required String instruction,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('recipes').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "summary": summary,
      "ingredients": ingredient,
      "instructions": instruction,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Recipe added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String summary,
    required String ingredient,
    required String instruction,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('recipes').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "summary": summary,
      "ingredients": ingredient,
      "instructions": instruction,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Recipe updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('recipes');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('recipes').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Recipe deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> savedItem({
    required String id,
    required String title,
    required String imageUrl,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('saved_recipes').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "savedID": id,
      "title": title,
      "imageUrl": imageUrl,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Recipe saved"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readSavedItem() {
    CollectionReference notesItemCollection =
    _mainCollection.doc(userUid).collection('saved_recipes');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteSavedItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('saved_recipes').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Recipe deleted from the database'))
        .catchError((e) => print(e));
  }
}

