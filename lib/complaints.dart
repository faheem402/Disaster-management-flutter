
import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

 


 @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final List<String> _complaints = ["Complaint 1", "Complaint 2", "Complaint 3"];
  final TextEditingController _complaintController = TextEditingController();

  void _addComplaint() {
    if (_complaintController.text.isNotEmpty) {
      setState(() {
        _complaints.add(_complaintController.text);
      });
      _complaintController.clear();
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             TextField(
              controller: _complaintController,
              decoration: InputDecoration(
                labelText: 'Enter your complaint',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addComplaint,
              child: Text('Submit Complaint'),
            ),
              Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _complaints.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_complaints[index]),
                      subtitle: Text('Reply:'),
                    ),
                  );
                },
              ),
            ),
          
           
          ],
        ),
      ),
    );
  }
}