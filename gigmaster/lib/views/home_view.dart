import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Text(
              'Hire the best talent across the world.',
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the text bold
                fontSize: 22.0, // You can set the font size as needed
              ),
            ),
            SizedBox(
                height: 20), // Add some space between the text and the list
            WorkoutCard(),
          ],
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate the width of the card based on the device's screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth =
        screenWidth * 0.9; // Adjust this percentage as needed

    return Container(
      width: cardWidth,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage(
              'lib/images/workout.jpeg'), // Replace with your image URL
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: const Text(
                    'Day 12',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Strength',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jaydon Kenter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          '25 min',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(Icons.flash_on, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          '530 kcal',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                // Add your action here
              },
              child: const Icon(Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }
}
