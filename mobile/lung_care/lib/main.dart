import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lung_care/firebase_options.dart';
import 'package:lung_care/model/controller.dart';
import 'package:lung_care/pages/intro.dart';
import 'package:lung_care/pages/login.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeModeData(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PredictionProvider(),
        )
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            initialRoute: '/intro',
            routes: {
              '/intro': (context) => IntroPage(),
              '/login': (context) => Login(),
            },
            themeMode: Provider.of<ThemeModeData>(context).themeMode,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              iconTheme: const IconThemeData(
                color: Colors.blue
              ),
              textTheme: const TextTheme(
                headlineLarge: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF819CCA),
                ),
                bodySmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF819CCA),
                  fontStyle: FontStyle.italic,
                ),
                bodyMedium: TextStyle(
                  fontSize: 15,
                  color: Color(0XFF819CCA),
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF819CCA)
                )
              )
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              iconTheme: const IconThemeData(
                color: Colors.black
              ),
              textTheme: const TextTheme(
                headlineLarge: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(129, 156, 202, 100),
                ),
                bodySmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(129, 156, 202, 100),
                  fontStyle: FontStyle.italic,
                ),
                bodyMedium: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(129, 156, 202, 100),
                  fontWeight: FontWeight.bold,
                ),
                bodyLarge: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(129, 156, 202, 100),
                )
              )
            ),
            // themeMode: ThemeMode.system,
            home: Scaffold(
              body: IntroPage(),
            ),
            // home: StreamBuilder<User?>(
            //   stream: FirebaseAuth.instance.authStateChanges(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Homepage(userData: userData,);
            //     } else {
            //       return IntroPage();
            //     }
            //   }
            // ),
          );
        }
      ),
    );
  }
}