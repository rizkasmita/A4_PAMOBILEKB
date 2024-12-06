import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
// import 'package:lung_care/pages/homepage.dart';
import 'package:provider/provider.dart';

class Benign extends StatelessWidget {
  const Benign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "Benign",
          style: TextStyle(
              fontSize: 20,
              color: Color(0XFF819CCA),
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0XFF819CCA),)
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Provider.of<ThemeModeData>(context).isDarkModeActive
                ? const Color.fromRGBO(54, 84, 134, 100)
                : Colors.white,
          ),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 350,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? const Color.fromRGBO(54, 84, 134, 100)
                        : Colors.white,
                      border:
                          Border.all(color: const Color(0XFF819CCA), width: 2),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 25),
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0XFF819CCA), width: 2),
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/benign.jpg'),
                      fit: BoxFit
                          .cover, // Mengatur agar gambar memenuhi Container
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 200, left: 10),
                  padding: const EdgeInsets.all(5),
                  width: 330,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeModeData>(context).isDarkModeActive
                        ? const Color.fromRGBO(54, 84, 134, 500)
                        : Colors.white,
                  ),
                  child: const Text(
                    "Tumor benign adalah tumor jinak yang tidak bersifat kanker. Tumor ini tidak menyebar ke bagian tubuh lain. Jenis tumor jinak pada paru-paru meliputi hamartoma, papilloma, dan leiomioma. Biasanya tumbuh lambat dan tidak invasif. Walaupun umumnya tidak berbahaya, tumor jinak dapat menyebabkan gejala jika ukurannya besar atau menekan saluran napas. Tumor jinak biasanya tidak membutuhkan pengobatan kecuali jika menimbulkan gejala atau risiko komplikasi. Pengangkatan melalui operasi mungkin dilakukan jika menimbulkan masalah kesehatan.",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}