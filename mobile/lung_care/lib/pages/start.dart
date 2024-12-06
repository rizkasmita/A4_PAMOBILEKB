import 'package:flutter/material.dart';
import 'package:lung_care/pages/login.dart';

class Started extends StatefulWidget {
  const Started({super.key});

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color.fromRGBO(54, 84, 134, 100),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: const Color(0xFFC6E7FF),
                  borderRadius: BorderRadius.circular(90)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 117,
              child: const Text(
                "Lung Care",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFC6E7FF)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 170,
              child: Text(
                "We care about your lung",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).brightness == Brightness.light
                      ? const Color(0XFF819CCA)
                      : Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 330),
              width: 335,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFC6E7FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                child: Text("Get Started",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color.fromRGBO(54, 84, 134, 100)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
