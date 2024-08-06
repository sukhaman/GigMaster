import 'package:flutter/material.dart';
import 'package:gigmaster/views/home_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late final Category? _category;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _category = ModalRoute.of(context)?.settings.arguments as Category?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category!.name),
      ),
      body: Text(_category.name),
    );
  }
}
