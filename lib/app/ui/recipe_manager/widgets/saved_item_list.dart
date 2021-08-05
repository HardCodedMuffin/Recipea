import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipea_app/app/ui/recipe_manager/recipe_manager.dart';
import 'package:recipea_app/app/utils/database.dart';
import 'package:recipea_app/services/spooncular_api.dart';

class SavedItemListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
        stream: Database.readSavedItem(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 6.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var recipeInfo = snapshot.data!.docs[index].data();
                  String docID = snapshot.data!.docs[index].id;
                  String recipeID = recipeInfo['savedID'];
                  String recipeTitle = recipeInfo['title'];
                  String imageUrl = recipeInfo['imageUrl'];
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
                        onTap: () async {
                          var recipe =
                              await APIService.instance.fetchRecipe(recipeID);
                          var nutrients =
                              await APIService.instance.fetchNutrients(recipeID);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RecipeDetails(
                                recipe: recipe,
                                nutrients: nutrients,
                                // analyzedInstructions: instructions,
                              ),
                            ),
                          );
                        },
                        leading: Image.network(imageUrl),
                        title: Text(
                          recipeTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            await Database.deleteSavedItem(
                              docId: docID,
                            );
                          },
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
