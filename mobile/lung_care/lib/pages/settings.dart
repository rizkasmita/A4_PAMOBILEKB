import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            color: Color(0XFF819CCA),
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFFC6E7FF),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0XFF819CCA),)
        ),
      ),
      body: Container(
        color: Provider.of<ThemeModeData>(context).isDarkModeActive
            ? const Color.fromRGBO(54, 84, 134, 100)
            : Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Provider.of<ThemeModeData>(context).isDarkModeActive
                    ? Icons.dark_mode
                    : Icons.light_mode
              ),
              title: const Text("Switch Mode"),
              trailing: Switch(
                value: Provider.of<ThemeModeData>(context).isDarkModeActive,
                onChanged: (bool value) {
                  Provider.of<ThemeModeData>(context, listen: false).changeTheme(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                }
              ),
              onTap: () {
                Provider.of<ThemeModeData>(context, listen: false).changeTheme(
                  Provider.of<ThemeModeData>(context, listen: false).isDarkModeActive
                    ? ThemeMode.light
                    : ThemeMode.dark,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}