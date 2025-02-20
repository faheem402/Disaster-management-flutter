// import 'package:flutter/material.dart';



// // Model for the Volunteer
// class Volunteer {
//   final String name;
//   final String role;
//   final String contact;

//   Volunteer({required this.name, required this.role, required this.contact});
// }

// // Generate some dummy data for the volunteers
// List<Volunteer> generateDummyVolunteers() {
//   return [
//     Volunteer(name: "John Doe", role: "Team Leader", contact: "+1234567890"),
//     Volunteer(name: "Jane Smith", role: "Coordinator", contact: "+9876543210"),
//     Volunteer(name: "Alice Brown", role: "Driver", contact: "+1122334455"),
//     Volunteer(name: "Bob Johnson", role: "Helper", contact: "+2233445566"),
//     Volunteer(name: "Charlie Davis", role: "Photographer", contact: "+3344556677"),
//   ];
// }

// // The main screen to display the volunteer list
// class VolunteerListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<Volunteer> volunteers = generateDummyVolunteers();

//     return Scaffold(
//       appBar: AppBar(title: Text("Volunteer List")),
//       body: ListView.builder(
//         itemCount: volunteers.length,
//         itemBuilder: (context, index) {
//           final volunteer = volunteers[index];
//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: ListTile(
//               leading: Icon(Icons.person, size: 40),
//               title: Text(volunteer.name, style: TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Role: ${volunteer.role}"),
//                   Text("Contact: ${volunteer.contact}"),
//                 ],
//               ),
//               isThreeLine: true,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mark/APIS/loginpageapi.dart';

// Model for the Volunteer
class Volunteer {
  final String name;
  final String role;
  final String contact;

  Volunteer({required this.name, required this.role, required this.contact});

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      name: json['name'],
      role: json['role'],
      contact: json['contact'],
    );
  }
}

class VolunteerListScreen extends StatefulWidget {
  @override
  _VolunteerListScreenState createState() => _VolunteerListScreenState();
}

class _VolunteerListScreenState extends State<VolunteerListScreen> {
  List<Volunteer> volunteers = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchVolunteers();
  }

  Future<void> fetchVolunteers() async {
    try {
      var response = await Dio().get('$baseurl/ViewVolunteers');print(response);
      if (response.statusCode == 200) {
        setState(() {
          volunteers = (response.data as List)
              .map((volunteer) => Volunteer.fromJson(volunteer))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load volunteers';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Volunteer List")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: volunteers.length,
                  itemBuilder: (context, index) {
                    final volunteer = volunteers[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        leading: Icon(Icons.person, size: 40),
                        title: Text(volunteer.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Role: ${volunteer.role}"),
                            Text("Contact: ${volunteer.contact}"),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
    );
  }
}