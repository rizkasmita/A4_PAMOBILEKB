import 'package:flutter/material.dart';

class Squamos extends StatelessWidget {
  const Squamos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "Squamous Cell Carcinoma",
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
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : const Color.fromRGBO(54, 84, 134, 100)
          ),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 350,
                  height: 550,
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : const Color.fromRGBO(54, 84, 134, 100),
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
                      image: AssetImage('assets/squamous.jpg'),
                      fit: BoxFit
                          .cover, // Mengatur agar gambar memenuhi Container
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 200, left: 10),
                  padding: const EdgeInsets.all(5),
                  width: 330,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color.fromRGBO(54, 84, 134, 500),
                  ),
                  child: const Text(
                    "Termasuk dalam kelompok NSCLC, karsinoma sel skuamosa adalah jenis kanker paru-paru yang berasal dari sel-sel skuamosa, yaitu sel datar yang melapisi saluran udara di paru-paru. Biasanya ditemukan di bagian tengah paru-paru, terutama di bronkus besar, dan sering dikaitkan dengan riwayat merokok. Batuk kronis, nyeri dada, suara serak, dan batuk berdarah adalah gejala yang umum. Merokok adalah faktor risiko terbesar untuk karsinoma sel skuamosa. Kanker ini cenderung tumbuh lebih lambat dibandingkan beberapa jenis kanker paru lainnya, tetapi dapat menyebabkan kerusakan parah pada jaringan paru-paru dan menyebar jika tidak ditangani. ",
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