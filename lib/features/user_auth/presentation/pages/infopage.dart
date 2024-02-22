import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../global/common/toast.dart';

class RequetInfopage extends StatelessWidget {
  static String id = 'Profilepage';
  final String documentId;

  RequetInfopage(this.documentId);

  // Method to fetch user data based on document ID
  Future<DocumentSnapshot> fetchUserData(String documentId) async {
    try {
      return await FirebaseFirestore.instance
          .collection('users')
          .doc(documentId)
          .get();
    } catch (e) {
      print('Error fetching user data: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                  showToast(message: "Successfully signed out");
                },
                child: Icon(
                  Icons.logout_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: fetchUserData(documentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            String imageUrl = userData[
                'image']; // Assuming 'image' is the field storing the image URL

            return ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl),
                            radius: 40,
                          ), // Use placeholder image if URL is null

                          SizedBox(width: 10),
                          Text(
                            userData['name'] ?? 'No Name',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              size: 50.0,
                              color: Colors.green,
                            ),
                            onPressed: () async {
                              String phoneNumber = userData['phone'];
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.home),
                                  title:
                                      Text('Address : ${userData['address']}'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.phone),
                                  title: Text(
                                      'Student Phone : ${userData['phone']}'),
                                ),
                                Divider(),
                                ListTile(
                                    leading: Icon(Icons.phone),
                                    title: Text('Sex : ${userData['gender']}')),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.home),
                                  title: Text('Age : ${userData['age']}'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.book_outlined),
                                  title: Text(
                                      'Blood require : ${userData['blood']}'),
                                ),
                                Divider(),
                                ListTile(
                                  leading: Icon(Icons.currency_rupee),
                                  title: Text(
                                      'Diagnosis : ${userData['diagnosis']}'),
                                ),
                                Divider(),

                                /// add rest of the field

                                ListTile(
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Show image when icon is pressed
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Print'),
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(Icons.document_scanner),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
      backgroundColor: Color(0xFFCFF3F8),
    );
  }
}
