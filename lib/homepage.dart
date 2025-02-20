import 'package:flutter/material.dart';
import 'package:mark/complaints.dart';
import 'package:mark/resourses.dart';
import 'package:mark/volunteers.dart';

class Homepage extends StatelessWidget {
  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_add))
        ],
        title: Text('Homepage'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 71, 228, 120), // AppBar background color
        elevation: 0,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResourcesListScreen()),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VolunteerListScreen()),
                  );
                },
              ),
              SizedBox(height: 16),
              SectionCard(
                title: 'Updates',
                description:
                    'Stay updated with the latest news, announcements, and events.',
                icon: Icons.update,
                onTap: () {
                  // Handle Updates section tap (e.g., navigate to UpdatesScreen)
                },
              ),
               SizedBox(height: 16),
              SectionCard(
                title: 'complaint',
                description:
                    'Send complaints to higher ups',
                icon: Icons.feedback_outlined,
                onTap: () {
                  // Handle Updates section tap (e.g., navigate to UpdatesScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComplaintPage()),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SectionCard widget with enhanced design
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
        elevation: 8.0, // Increased elevation for a more prominent look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // More rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 98, 246, 125), const Color.fromARGB(255, 76, 200, 83)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16), // Same border radius
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: const Color.fromARGB(255, 85, 245, 98)),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
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



