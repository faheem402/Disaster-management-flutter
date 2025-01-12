import 'package:flutter/material.dart';
import 'package:mark/resourses.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionCard(
                title: 'Resources',
                description:
                    'Access important documents, tools, and materials to help with your work.',
                icon: Icons.library_books,
                onTap: () {
                  // Navigate to the ResourcesListScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResourcesListScreen
                    ()),
                  );
                },
              ),
              SizedBox(height: 16),
              SectionCard(
                title: 'Volunteers',
                description:
                    'Join our volunteer team and contribute to a meaningful cause.',
                icon: Icons.volunteer_activism,
                onTap: () {
                  // Handle Volunteers section tap (if needed)
                },
              ),
              SizedBox(height: 16),
              SectionCard(
                title: 'Updates',
                description:
                    'Stay updated with the latest news, announcements, and events.',
                icon: Icons.update,
                onTap: () {
                  // Handle Updates section tap (if needed)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Function onTap;

  const SectionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}