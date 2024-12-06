import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> regis(BuildContext context, String name, String email, String pw) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pw,
      );

      final userId = user.user?.uid;

      if (userId != null) {
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'name': name,
          'email': email,
          'password': pw,
          'createdAt': Timestamp.now(),
        });
        Navigator.pop(context);
      } else {
        throw Exception("User ID not found");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  Future<Map<String, dynamic>?> login(BuildContext context, String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = user.user?.uid;
      if(userId != null) {
        final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
        if (userDoc.exists) {
          return userDoc.data();
        }
      }
      return null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )
      );
      return null;
    }
  }
}
