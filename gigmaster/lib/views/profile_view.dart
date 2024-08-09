import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('lib/images/yoga.jpeg'),
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  'John Cena',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                // Use LayoutBuilder to manage available space
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: _isExpanded ? constraints.maxHeight : 150,
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              left: _isExpanded ? 0 : 20,
                              top: _isExpanded ? 0 : 20,
                              width: _isExpanded
                                  ? constraints.maxWidth
                                  : constraints.maxWidth,
                              height: _isExpanded ? constraints.maxHeight : 100,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: _isExpanded
                                      ? BorderRadius.zero
                                      : BorderRadius.circular(12),
                                ),
                                child: _isExpanded
                                    ? FullHealthView(onClose: _toggleExpand)
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            HealthView(onTap: _toggleExpand),
                                            const SizedBox(
                                                width:
                                                    10), // Add spacing between widgets
                                            StepsCountView(
                                                onTap: _toggleExpand),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}

class FullHealthView extends StatelessWidget {
  final VoidCallback onClose;
  const FullHealthView({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Full Health View',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class HealthView extends StatelessWidget {
  final VoidCallback onTap;
  const HealthView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Health',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class StepsCountView extends StatelessWidget {
  final VoidCallback onTap;
  const StepsCountView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 142, 33),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Steps Count',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
