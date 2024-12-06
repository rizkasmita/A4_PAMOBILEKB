import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference predictions = FirebaseFirestore.instance.collection('history').doc(userId).collection('predictions');

    String getImageUrl (String imageName) {
      return 'http://0.0.0.0:8000/api/serve-image/$imageName';
    }

    return Scaffold(
      body: Container(
        color: Provider.of<ThemeModeData>(context).isDarkModeActive
            ? const Color.fromRGBO(54, 84, 134, 100)
            : Colors.white,
        child: StreamBuilder<QuerySnapshot>(
          stream: predictions.orderBy('timestamp', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No history yet."));
            }
        
            final data = snapshot.data!.docs;
            
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var prediction = data[index];
                return ListTile(
                  leading: Icon(Icons.history, color: Colors.blue),
                  title: Text(prediction['prediction']),
                  subtitle: Text(
                    (prediction['timestamp'] as Timestamp).toDate().toString(),
                  ),
                  trailing: Image.network(
                    // prediction['image'] ?? '',
                    getImageUrl(prediction['image']),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}