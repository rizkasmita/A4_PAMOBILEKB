import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:lung_care/model/controller.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'prediction.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);

    return Scaffold(
      body: Container(
        color: Provider.of<ThemeModeData>(context).isDarkModeActive
            ? const Color.fromRGBO(54, 84, 134, 100)
            : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Teks deskripsi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Choose an option to upload an image for prediction",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0XFF819CCA),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Tombol Take Photo
              SizedBox(
                width: 250, // Lebar tombol
                height: 50, // Tinggi tombol
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await predictionProvider.pickImage(ImageSource.camera);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Prediction(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Provider.of<ThemeModeData>(context)
                            .isDarkModeActive
                        ? const Color.fromRGBO(54, 84, 134, 1)
                        : const Color(0xFFC6E7FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? const Color(0xFFC6E7FF)
                        : const Color.fromRGBO(54, 84, 134, 1),
                  ),
                  label: Text(
                    "Take Photo",
                    style: TextStyle(
                      fontSize: 16,
                      color: Provider.of<ThemeModeData>(context).isDarkModeActive
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color(0XFF819CCA),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tombol Import Image
              SizedBox(
                width: 250, // Lebar tombol sama dengan tombol Take Photo
                height: 50, // Tinggi tombol sama
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await predictionProvider.pickImage(ImageSource.gallery);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Prediction(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Provider.of<ThemeModeData>(context)
                            .isDarkModeActive
                        ? const Color.fromRGBO(54, 84, 134, 1)
                        : const Color(0xFFC6E7FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(
                    Icons.image,
                    color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? const Color(0xFFC6E7FF)
                        : const Color.fromRGBO(54, 84, 134, 1),
                  ),
                  label: Text(
                    "Import Image",
                    style: TextStyle(
                      fontSize: 16,
                      color: Provider.of<ThemeModeData>(context).isDarkModeActive
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color(0XFF819CCA),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Provider.of<ThemeModeData>(context).isDarkModeActive
          ? const Color.fromRGBO(30, 30, 30, 1)
          : const Color(0xFFF5F5F5),
    );
  }
}
