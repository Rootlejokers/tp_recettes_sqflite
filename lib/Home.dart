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
        title: Text("Liste des recettes"),
        centerTitle: true,
      ),
    );

  }
}
