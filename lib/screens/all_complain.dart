import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screens.dart';

class AllComplaints extends StatefulWidget {
  const AllComplaints({Key? key});

  @override
  State<AllComplaints> createState() => _AllComplaintsState();
}

class _AllComplaintsState extends State<AllComplaints> {
  final CollectionReference complaints =
  FirebaseFirestore.instance.collection('complaints');

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
                    "All Complaints (User)",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: complaints.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children:
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                    String bodyText = data['body'] ?? '';

                    if (bodyText.length > 100) {
                      bodyText = bodyText.substring(0, 100) + '...';
                    }

                    // Determine the color based on severity
                    Color severityColor = Colors.black;
                    switch (data['severity']) {
                      case 'Low':
                        severityColor = Colors.yellow;
                        break;
                      case 'Medium':
                        severityColor = Colors.orange;
                        break;
                      case 'High':
                        severityColor = Colors.red;
                        break;
                      default:
                        severityColor = Colors.black;
                    }

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(data['title'] ?? '', style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bodyText),
                              SizedBox(height: 5),
                              Text(
                                'Severity: ${data['severity'] ?? ''}',
                                style: TextStyle(
                                  color: severityColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // Add more fields if necessary
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubmitComplaint()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
