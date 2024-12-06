import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lung_care/model/controller.dart';
import 'package:provider/provider.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Prediction extends StatelessWidget {
  const Prediction({super.key});

  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);

    String? predictedClass;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference history = firestore.collection('history');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "Lung Cancer Prediction",
          style: TextStyle(
            fontSize: 20,
            color: Color(0XFF819CCA),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            predictionProvider.clear();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Color(0XFF819CCA)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Provider.of<ThemeModeData>(context).isDarkModeActive
                  ? const Color.fromRGBO(54, 84, 134, 100)
                  : Colors.white,
            ),
            child: Column(
              children: [
                // if (predictionProvider.imageFile == null)
                //   Text("image null"),
                predictionProvider.imageFile != null
                  ? Image.file(predictionProvider.imageFile!)
                  : Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.image,
                      color: Colors.grey[400],
                    ),
                  ),
                // Tampilkan pesan hasil prediksi dengan style yang sudah ditentukan
                if (predictionProvider.predictionMessage != null)
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          Provider.of<ThemeModeData>(context).isDarkModeActive
                              ? const Color.fromRGBO(54, 84, 134, 100)
                              : Colors.white,
                      border:
                          Border.all(color: const Color(0XFF819CCA), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      predictionProvider.predictionMessage!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF819CCA),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 16),
                // Tombol untuk menjalankan prediksi
                ElevatedButton(
                  onPressed: () async {
                    predictedClass = await predictionProvider.predictImage();
                
                    User? user = FirebaseAuth.instance.currentUser;
                    String? userId = user?.uid;
                
                    if (userId != null) {
                      history.doc(userId).collection('predictions').add({
                        'image' : predictionProvider.imageName,
                        'timestamp' : Timestamp.now(),
                        'prediction' : predictedClass
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Provider.of<ThemeModeData>(context).isDarkModeActive
                            ? const Color.fromRGBO(54, 84, 134, 1)
                            : const Color(0xFFC6E7FF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: Text('Predict'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
