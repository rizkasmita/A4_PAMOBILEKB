import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          // child: _widgetoption.elementAt(_selectedIndex),
          ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/adenocarcinoma.jpg'),
              ),
              accountName: Text(
                "Lung Care",
                style: TextStyle(
                    color: Color(0XFF819CCA), fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'ID: 66282317',
                style: TextStyle(
                    color: Color(0XFF819CCA), fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(color: Color(0xFFC6E7FF)),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const Settings();
                //     },
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
