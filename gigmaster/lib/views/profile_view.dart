import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular user image
                  const CircleAvatar(
                    radius: 100, // Adjust the radius as needed
                    backgroundImage: AssetImage('lib/images/yoga.jpeg'),
                    backgroundColor: Colors
                        .transparent, // Transparent background for the circle
                  ),
                  const SizedBox(height: 16), // Add spacing
                  // User name or other details
                  Text(
                    'John Cena',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  // Add more content here as needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
