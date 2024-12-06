import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

class Info3 extends StatelessWidget {
  const Info3({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeModeData>(context).isDarkModeActive;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "Symptoms of Lung Cancer",
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
                              image: AssetImage('assets/info3.jpg'),
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
                                """
Coughing and chest pain may be symptoms of lung cancer.
People can have different symptoms for lung cancer. Some people have symptoms related to the lungs. Some people whose lung cancer has spread to other parts of the body (metastasized) have symptoms specific to that part of the body. Some people just have general symptoms of not feeling well. Most people with lung cancer don't have symptoms until the cancer is advanced.

Lung cancer symptoms may include :

1. Coughing that gets worse or doesn't go away.
2. Chest pain.
3. Shortness of breath.
4. Wheezing.
5. Coughing up blood.
6. Feeling very tired all the time.
7. Weight loss with no known cause.

Other changes that can sometimes occur with lung cancer may include repeated bouts of pneumonia and swollen or enlarged lymph nodes (glands) inside the chest in the area between the lungs.

These signs and symptoms can happen with other illnesses, too. If you have some of these signs and symptoms, talk to your doctor, who can help find the cause.

Source : U.S. Centers for Disease Control and Prevention""",
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
