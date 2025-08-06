import 'package:flutter/material.dart';
import '../models/redipe_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onDelete;

  const RecipeCard({Key? key, required this.recipe, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(recipe.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(recipe.description, maxLines: 2),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}