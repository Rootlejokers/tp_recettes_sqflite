import 'package:flutter/material.dart';
import 'package:tp_recettes_sqflite/custom/custom_card.dart';
import 'package:tp_recettes_sqflite/services/database_helper.dart';
import 'models/redipe_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    DatabaseHelper().getAll().then((list) {
      setState(() => _recipes = list);
    });
  }
  void _addRecipe() async {
    final t = _titleCtrl.text.trim();
    final d = _descCtrl.text.trim();
    if (t.isEmpty || d.isEmpty) return;

    final recipe = Recipe(title: t, description: d);
    await DatabaseHelper().insert(recipe);

    setState(() {
      _recipes.add(recipe);
      _titleCtrl.clear();
      _descCtrl.clear();
    });
  }

  void _deleteRecipe(Recipe r) async {
    if (r.id != null) {
      await DatabaseHelper().delete(r.id!);
    }
    setState(() => _recipes.remove(r));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des recettes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(20),

            child: Column(
              children: [
                TextField(
                  controller: _titleCtrl,
                  decoration: InputDecoration(
                      labelText: "titer"
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _descCtrl,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addRecipe,
                  child: Text('Ajouter la recette'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          RecipeCard(
              recipe: Recipe(
                  title: "Eru",
                  description: "description"
              ),
              onDelete:() {
              }
          ),RecipeCard(
              recipe: Recipe(
                  title: "Eru",
                  description: "description"
              ),
              onDelete:() {
              }
          ),RecipeCard(
              recipe: Recipe(
                  title: "Eru",
                  description: "description"
              ),
              onDelete:() {
              }
          ),RecipeCard(
              recipe: Recipe(
                  title: "Eru",
                  description: "description"
              ),
              onDelete:() {
              }
          ),RecipeCard(
              recipe: Recipe(
                  title: "Eru",
                  description: "description"
              ),
              onDelete:() {
              }
          ),RecipeCard(
              recipe: Recipe(
                  title: "Eru",
                  description: "description"
              ),
              onDelete:() {
              }
          ),
        ],
      )
    );

  }
}