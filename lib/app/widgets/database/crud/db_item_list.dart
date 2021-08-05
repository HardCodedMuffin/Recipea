import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/recipe_manager/view/db_edit_screen.dart';
import 'package:recipea_app/app/utils/database.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var recipeInfo = snapshot.data!.docs[index].data();
              String docID = snapshot.data!.docs[index].id;
              String title = recipeInfo['title'];
              String summary = recipeInfo['summary'];
              String ingredients = recipeInfo['ingredients'];
              String instruction = recipeInfo['instructions'];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DbEditScreen(
                          currentTitle: title,
                          currentSummary: summary,
                          currentIngredient: ingredients,
                          currentInstruction: instruction,
                          documentId: docID,
                        ),
                      ),
                    ),
                    title: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      summary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.grey,
            ),
          ),
        );
      },
    );
  }
}