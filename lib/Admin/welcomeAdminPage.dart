import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:carmanager/Admin/carLocationPage.dart';
import 'package:carmanager/Admin/transferTicketsPage.dart';

class WelcomeAdminPage extends StatefulWidget {
  const WelcomeAdminPage({super.key});

  @override
  State<WelcomeAdminPage> createState() => _WelcomeAdminPageState();
}

class _WelcomeAdminPageState extends State<WelcomeAdminPage> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransferTickets()),
                );
              },
              child: Text('Voir les transferts'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('location')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        // final documentId = snapshot.data!.docs[index].id;
                        final currentUser = FirebaseAuth.instance.currentUser;
                        final userId = currentUser!.uid;
                        return CarLocationPage(userId);
                      },
                    ),
                  ),
                );
              },
              child: Text('Localisation de la voiture'),
            ),
          ],
        ),
      ),
    );
  }
}
