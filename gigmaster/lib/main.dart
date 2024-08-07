import 'package:flutter/material.dart';
import 'package:gigmaster/constants/routes.dart';
import 'package:gigmaster/views/category_view.dart';
import 'package:gigmaster/views/tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 130, 129, 133)),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      routes: {
        categoryRoute: (context) => const CategoryView(),
      },
    );
  }
}
