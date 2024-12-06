import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

class Info2 extends StatelessWidget {
  const Info2({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeModeData>(context).isDarkModeActive;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "Causes of Lung Cancer",
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
                              image: AssetImage('assets/info2.jpg'),
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
                                """Lung cancer is a serious health issue, and understanding the causes can help in prevention. According to the U.S. Centers for Disease Control and Prevention, the following are primary causes of lung cancer :

1. Smoking : Cigarette smoking is the leading cause of lung cancer. In the U.S., about 80% to 90% of lung cancer deaths are linked to smoking. The toxic mix of over 7,000 chemicals in tobacco smoke, many of which are carcinogenic, significantly increases the risk. Even smoking a few cigarettes a day can raise the risk. Quitting smoking reduces the risk of lung cancer over time.

2. Secondhand Smoke : Exposure to secondhand smoke also increases the risk of lung cancer. Even if you do not smoke, breathing in the smoke from others can cause lung cancer.

3. Radon Exposure : Radon is a naturally occurring gas that can build up in homes or buildings. This colorless, odorless gas is a leading cause of lung cancer, especially in smokers. Testing and reducing radon levels in your home can help lower the risk.

4. Asbestos and Other Workplace Exposure : Exposure to hazardous substances like asbestos, arsenic, diesel exhaust, and certain forms of silica and chromium in the workplace increases the risk of lung cancer. The risk is even higher for smokers exposed to these substances.

5. Air Pollution : Long-term exposure to outdoor air pollution, especially in areas with high levels of pollutants, raises the risk of developing lung cancer.

6. Family History and Genetics : A personal or family history of lung cancer increases the risk. If relatives have had lung cancer, especially if they smoked or lived in a high-risk environment, the likelihood of developing lung cancer is higher. Some genetic mutations can also increase risk.

7. Radiation Therapy : Individuals who have received radiation therapy to the chest area for other cancers are at a higher risk of developing lung cancer later in life.

8. Diet and Supplements : Some studies suggest that smoking while taking beta carotene supplements can increase the risk of lung cancer. Additionally, exposure to arsenic and radon in drinking water, especially from private wells, can also contribute to the risk.

Preventive measures such as quitting smoking, reducing exposure to radon and air pollution, and avoiding workplace hazards can help reduce the risk of lung cancer.

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
