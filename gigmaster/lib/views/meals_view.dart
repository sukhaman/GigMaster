import 'package:flutter/material.dart';

class MealsView extends StatefulWidget {
  const MealsView({super.key});

  @override
  _MealsViewState createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  List<MealType> types = [
    MealType(name: 'All'),
    MealType(name: 'Breakfast'),
    MealType(name: 'Lunch'),
    MealType(name: 'Dinner'),
    MealType(name: 'Snack'),
  ];

  List<Meal> mealList = [
    Meal(
      name: 'Papeta par Eda',
      description:
          'The most amazing egg recipes in India are found in the Parsi community, but papeta par eda (eggs over potatoes) is hands-down my favorite. You can have it for breakfast, lunch, dinner or a snack. Sometimes it’s even prepared with potato chips instead of sliced potatoes! If you have any leftover cooked potatoes, you can reheat them in a small skillet and poach a fresh egg on top. Sprinkle with some more chopped cilantro and you have a delicious dish in minutes.',
      ingredentCount: 10,
      cookTime: 30,
      nutritionValue: '521 calories',
      isFavorite: false,
      ingrendients: [
        Ingredient(name: 'Vegetable oil', quantity: 4),
        Ingredient(name: 'Red onions oil', quantity: 3),
      ],
      directions: 'Heat the oil in a large heavy skillet over medium-high heat',
      type: 'Breakfast',
    ),
    Meal(
      name: 'Spaghetti',
      description: 'Delicious spaghetti with tomato sauce',
      ingredentCount: 5,
      cookTime: 20,
      nutritionValue: '400 calories',
      isFavorite: false,
      ingrendients: [
        Ingredient(name: 'Spaghetti', quantity: 1),
        Ingredient(name: 'Tomato sauce', quantity: 1),
      ],
      directions: 'Boil spaghetti and add tomato sauce',
      type: 'Lunch',
    ),
    Meal(
      name: 'Salad',
      description: 'Fresh garden salad with vinaigrette dressing',
      ingredentCount: 3,
      cookTime: 10,
      nutritionValue: '150 calories',
      isFavorite: false,
      ingrendients: [
        Ingredient(name: 'Lettuce', quantity: 1),
        Ingredient(name: 'Tomato', quantity: 1),
        Ingredient(name: 'Cucumber', quantity: 1),
      ],
      directions: 'Mix all ingredients and add dressing',
      type: 'Dinner',
    ),
    // Add more meals as needed
  ];

  String selectedMealType = 'All'; // Initial selected meal type

  @override
  Widget build(BuildContext context) {
    // Filter meal list based on selected meal type
    List<Meal> filteredMeals = selectedMealType == 'All'
        ? mealList
        : mealList.where((meal) => meal.type == selectedMealType).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Best recipes\nfor you',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: types.length,
                    itemBuilder: (context, index) {
                      final type = types[index];
                      final textWidth = calculateTextWidth(type.name);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMealType = type.name;
                          });
                        },
                        child: Container(
                          width: textWidth + 32,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: selectedMealType == type.name
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.white,
                            borderRadius:
                                BorderRadius.circular((textWidth + 32) / 2),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          child: Center(
                            child: Text(
                              type.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: filteredMeals
                            .map((meal) => Card(
                                  child: MealPreview(meal: meal),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to calculate text width
  double calculateTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}

class MealType {
  final String name;
  MealType({
    required this.name,
  });
}

class Meal {
  final String name;
  final String description;
  final int ingredentCount;
  final int cookTime;
  final String nutritionValue;
  final bool isFavorite;
  final List<Ingredient> ingrendients;
  final String directions;
  final String type; // Add a type property to the Meal class

  Meal({
    required this.name,
    required this.description,
    required this.ingredentCount,
    required this.cookTime,
    required this.nutritionValue,
    required this.isFavorite,
    required this.ingrendients,
    required this.directions,
    required this.type,
  });
}

class Ingredient {
  final String name;
  final int quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });
}

class MealPreview extends StatelessWidget {
  final Meal meal;
  const MealPreview({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.asset('lib/images/yoga.jpeg'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('${meal.ingredentCount} ingredients'),
                      const SizedBox(width: 10),
                      Text('${meal.cookTime} min'),
                      const SizedBox(width: 10),
                      Text('${meal.nutritionValue} kcal'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
