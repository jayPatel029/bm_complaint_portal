import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bm_complaint_portal_app/widgets/widgets.dart';

class SubmitComplaint extends StatefulWidget {
  const SubmitComplaint({Key? key});

  @override
  State<SubmitComplaint> createState() => _SubmitComplaintState();
}

class _SubmitComplaintState extends State<SubmitComplaint> {
  TextEditingController compTitle = TextEditingController();
  TextEditingController compBody = TextEditingController();
  String? _selectedSeverity;

  final CollectionReference complaints =
      FirebaseFirestore.instance.collection('complaints');

  Future<void> _submitComplaint() async {
    if (_selectedSeverity == null ||
        compTitle.text.isEmpty ||
        compBody.text.isEmpty) {
      // Show an error message if severity, title, or body is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields and select severity'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Add complaint data to Firestore
      await complaints.add({
        'title': compTitle.text,
        'body': compBody.text,
        'severity': _selectedSeverity,
        'timestamp': FieldValue.serverTimestamp(), // Add timestamp
      });

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Complaint submitted successfully'),
          backgroundColor: Colors.green,
        ),
      );

      // Clear text fields and selected severity
      compTitle.clear();
      compBody.clear();
      setState(() {
        _selectedSeverity = null;
      });
    } catch (e) {
      // Show an error message if submission fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit complaint'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 10,
        backgroundColor: Colors.green,
        title: Text(
          "Complaint Portal",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Icon(
            CupertinoIcons.profile_circled,
            size: 45,
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Submit Complaint",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            CustomTextfield(
              hint: 'Complaint Title',
              controller: compTitle,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
              height: 250,
              hint: 'Complaint Summary',
              controller: compBody,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButtonFormField<String>(
                    value: _selectedSeverity,
                    hint: const Text('Select Severity'),
                    onChanged: (value) {
                      setState(() {
                        _selectedSeverity = value;
                      });
                    },
                    items: ['Low', 'Medium', 'High'].map((String severity) {
                      return DropdownMenuItem<String>(
                        value: severity,
                        child: Text(severity),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 220,
            ),
            CustomButton(
              Bname: 'Submit',
              onTap: _submitComplaint,
              height: 55,
              width: 360,
            ),
          ],
        ),
      ),
    );
  }
}
