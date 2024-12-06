import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

class Info4 extends StatelessWidget {
  const Info4({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeModeData>(context).isDarkModeActive;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC6E7FF),
        title: const Text(
          "How We Detect Lung Cancer",
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
                              image: AssetImage('assets/info4.jpg'),
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
                                """This app uses advanced technology to detect lung cancer through medical imaging. Here's how the process works :

1. Image Upload : You upload a medical image (such as an X-ray or CT scan) through the app.

2. Preprocessing : The image is preprocessed, including resizing and adjusting to a format suitable for analysis by our system.

3. Convolutional Neural Networks (CNN) : The image is passed through a Convolutional Neural Network (CNN), which is a deep learning model designed to recognize patterns in visual data.

4. Analysis : The CNN analyzes the image and looks for potential indicators of lung cancer.

5. Prediction : The system predicts whether there are signs of lung cancer, and provides a result based on its findings. 

6. Consultation Recommendation : While the app offers an initial screening, it is important to consult a healthcare professional for a more thorough evaluation.

This process leverages the power of AI to assist in the early detection of lung cancer, potentially saving lives by identifying issues in their earliest stages.

Note : The results provided by the app are only for informational purposes and should not replace a professional medical diagnosis.""",
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
