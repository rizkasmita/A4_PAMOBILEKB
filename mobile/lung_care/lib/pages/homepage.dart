import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:lung_care/pages/homepagecontent.dart';
import 'package:lung_care/pages/history.dart';
import 'package:lung_care/pages/predictionpage.dart'; 
import 'package:lung_care/pages/settings.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  final Map<String, dynamic> userData;
  const Homepage({Key? key, required this.userData}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Homepagecontent(userData: widget.userData), 
      PredictionPage(),                 
      History(),                               
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeModeData>(context).isDarkModeActive;
    final name = widget.userData['name']; 
    final email = widget.userData['email']; 

    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: isDarkMode
            ? const Color.fromRGBO(54, 84, 134, 1)
            : Colors.white,
        selectedItemColor: isDarkMode
            ? const Color(0xFFC6E7FF)
            : const Color.fromRGBO(54, 84, 134, 1),
        unselectedItemColor: isDarkMode
            ? const Color(0xFF819CCA)
            : const Color.fromARGB(255, 97, 120, 137),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Prediction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History', // History tab added
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color.fromRGBO(54, 84, 134, 1)
            : const Color(0xFFC6E7FF),
        title: const Text(
          "Lung Care",
          style: TextStyle(
            color: Color(0XFF819CCA),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: isDarkMode
            ? const Color.fromRGBO(54, 84, 134, 1)
            : Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              accountName: Text(
                "$name",
                style: const TextStyle(
                    color: Color(0XFF819CCA), fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "$email",
                style: const TextStyle(
                    color: Color(0XFF819CCA), fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(color: Color(0xFFC6E7FF)),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: isDarkMode
                      ? const Color(0xFFC6E7FF)
                      : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MySettings();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                'Log Out',
                style: TextStyle(
                  color: isDarkMode
                      ? const Color(0xFFC6E7FF)
                      : Colors.black,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
