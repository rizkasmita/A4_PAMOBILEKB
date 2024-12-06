import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

class Info1 extends StatelessWidget {
  const Info1({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeModeData>(context).isDarkModeActive;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "How to Make Your Lungs Healthy",
          style: TextStyle(
            fontSize: 20,
            color: Color(0XFF819CCA),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Color(0XFF819CCA)),
        ),
      ),
      backgroundColor: isDarkMode
          ? const Color.fromRGBO(54, 84, 134, 1)
          : const Color(0xFFC6E7FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0XFF819CCA), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(0XFF819CCA), width: 2),
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/info1.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                          width: double.infinity,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SingleChildScrollView(
                              child: Text(
                                """Your lungs work tirelessly, taking about 23,000 breaths daily to deliver oxygen and remove waste. While aging reduces lung capacity, these steps can help maintain and improve lung health :

1. Stop Smoking and Avoid Secondhand Smoke : Smoking damages airways and increases the risk of COPD and lung cancer. Quitting smoking begins healing within 24 hours.

2. Exercise Regularly : Physical activity strengthens both heart and lungs, improving oxygen efficiency.

3. Maintain a Healthy Diet and Hydration : Balanced nutrition fuels metabolism, while hydration helps thin mucus for easier breathing.

4. Get Regular Check-ups : Routine medical visits can detect early signs of lung disease.

5. Stay Vaccinated : Vaccines reduce risks of severe respiratory infections like flu, COVID-19, and pneumonia.

6. Avoid Outdoor Air Pollution : Check local air quality to limit exposure to harmful pollutants.

7. Improve Indoor Air Quality : Minimize indoor pollutants by dusting, changing air filters, and keeping spaces smokefree.

8. Practice Deep Breathing : Breathing exercises enhance lung capacity and help manage stress.

9. Maintain Hygiene : Wash hands frequently and use masks during outbreaks to prevent infections.

10. Lung Cancer Screening : Low-dose CT scans can detect lung cancer early for those at high risk.

Source : American Lung Association""",
                                style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                    color: isDarkMode
                                        ? const Color(0xFFC6E7FF)
                                        : Color(0XFF819CCA)),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
