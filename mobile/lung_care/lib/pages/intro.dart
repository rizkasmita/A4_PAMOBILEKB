import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lung_care/pages/login.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      next: const Text(
        'Next',
        style: TextStyle(color: Color.fromRGBO(54, 84, 134, 1), fontWeight: FontWeight.bold),
      ),
      done: const Text(
        'Done',
        style: TextStyle(color: Color.fromRGBO(54, 84, 134, 1), fontWeight: FontWeight.bold),
      ),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      },
      pages: [
        PageViewModel(
          title: 'Welcome to Lung Care',
          body: 'We care about your lungs. Let us guide you through.',
          image: Center(
            child: Image.asset('assets/logo.png', height: 200),
          ),
        ),
        PageViewModel(
          title: 'Track Your Health',
          body: 'Monitor your lung health with ease.',
          image: Center(
            child: Image.asset('assets/logo.png', height: 175),
          ),
        ),
      ],
    );
  }
}