import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
// import 'package:lung_care/pages/homepage.dart';
import 'package:provider/provider.dart';


class Adenocarcinoma extends StatelessWidget {
  const Adenocarcinoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "Adenocarcinoma",
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
                      image: AssetImage('assets/adenocarcinoma.jpg'),
                      fit: BoxFit
                          .cover, 
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
                    "Jenis kanker paru-paru non-sel kecil (non-small cell lung cancer, NSCLC) yang paling umum. Kanker ini berasal dari sel-sel kelenjar yang berada di bagian luar paru-paru, terutama di sel-sel yang mengeluarkan lendir. Dapat terjadi pada perokok dan bukan perokok, tetapi paling sering ditemukan pada perokok ringan, mantan perokok, dan non-perokok. Gejalanya meliputi batuk persisten, nyeri dada, sesak napas, dan dalam beberapa kasus, batuk berdarah. Cenderung tumbuh lebih lambat dibanding jenis kanker lainnya, dan mungkin terdeteksi sebelum menyebar.",
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