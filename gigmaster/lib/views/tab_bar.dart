import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gigmaster/bloc/tab_bloc.dart';
import 'package:gigmaster/views/home_view.dart';
import 'package:gigmaster/views/meals_view.dart';
import 'package:gigmaster/views/settings_view.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodies = [
      const Center(
        child: HomeView(),
      ),
      const Center(
        child: MealsView(),
      ),
      const Center(
        child: SettingsView(),
      ),
    ];
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_gymnastics), label: 'Workouts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.breakfast_dining), label: 'Meals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
