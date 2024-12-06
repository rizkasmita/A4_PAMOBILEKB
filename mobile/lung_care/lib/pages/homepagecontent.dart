import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:lung_care/pages/adenocarcinoma.dart';
import 'package:lung_care/pages/benign.dart';
import 'package:lung_care/pages/info1.dart';
import 'package:lung_care/pages/info2.dart';
import 'package:lung_care/pages/info3.dart';
import 'package:lung_care/pages/info4.dart';
import 'package:lung_care/pages/squamous.dart';
import 'package:provider/provider.dart';

class Homepagecontent extends StatelessWidget {
  final Map<String, dynamic> userData;
  const Homepagecontent({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final String name = userData['name'] ?? 'Unknown';
    final isDarkMode = Provider.of<ThemeModeData>(context).isDarkModeActive;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: isDarkMode
            ? const Color.fromRGBO(54, 84, 134, 100)
            : Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ?  const Color.fromRGBO(54, 84, 134, 1)
                              :  const Color(0xFFC6E7FF),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                    ),
                    Container(
                      margin:
                           const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Hello, $name!",
                        style: TextStyle(
                          fontSize: 25,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ?  const Color.fromARGB(255, 255, 255, 255)
                              :  const Color.fromRGBO(54, 84, 134, 1),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                           const EdgeInsets.only(top: 80, left: 20),
                      child: Text(
                          """Welcome to Lung Care App! 
Your Lung Health Partner""",
                          style: TextStyle(
                          fontSize: 14,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ?  const Color(0xFFC6E7FF)
                              : const Color(0XFF819CCA),
                        ),)
                    ),
                  ]),
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        "Type of Lung Diseases",
                        style: TextStyle(
                          fontSize: 17,
                          color: Provider.of<ThemeModeData>(context)
                                  .isDarkModeActive
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromRGBO(54, 84, 134, 1),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const Adenocarcinoma();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFFC6E7FF),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/adenocarcinoma.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Adenocarcinoma",
                                    style:
                                        TextStyle(color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ? const Color(0xFFC6E7FF)
                                    : const Color(0XFF819CCA))
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const Benign();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFFC6E7FF),
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('assets/benign.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Benign",
                                    style:
                                        TextStyle(color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ?  const Color(0xFFC6E7FF)
                                    : const Color(0XFF819CCA))
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const Squamos();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFFC6E7FF),
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('assets/squamous.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Squamous Cell",
                                    style:
                                        TextStyle(color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ?  const Color(0xFFC6E7FF)
                                    : const Color(0XFF819CCA))
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                                left: 5, top: 10, bottom: 10),
                            child: Text(
                              "Get to know your lungs",
                              style: TextStyle(
                                fontSize: 17,
                                color: Provider.of<ThemeModeData>(context)
                                        .isDarkModeActive
                                    ?  const Color.fromARGB(255, 255, 255, 255)
                                    :  const Color.fromRGBO(54, 84, 134, 1),
                              ),
                            )),
                        buildMenu(
                          context: context,
                          text: "How to Make your Lungs Healthy",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Info1(),
                              ),
                            );
                          },
                          isDarkMode: isDarkMode,
                        ),
                        buildMenu(
                          context: context,
                          text: "Causes of Lung Cancer",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Info2(),
                              ),
                            );
                          },
                          isDarkMode: isDarkMode,
                        ),
                        buildMenu(
                          context: context,
                          text: "Symptoms of Lung Cancer",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Info3(),
                              ),
                            );
                          },
                          isDarkMode: isDarkMode,
                        ),
                        buildMenu(
                          context: context,
                          text: "How We Detect Lung Cancer",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Info4(),
                              ),
                            );
                          },
                          isDarkMode: isDarkMode,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 20, bottom: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       ElevatedButton.icon(
                  //         onPressed: () async {
                  //           await predictionProvider
                  //               .pickImage(ImageSource.camera);
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Prediction(),
                  //             ),
                  //           );
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Provider.of<ThemeModeData>(context)
                  //                   .isDarkModeActive
                  //               ?  const Color.fromRGBO(54, 84, 134, 1)
                  //               :  const Color(0xFFC6E7FF),
                  //           padding:  const EdgeInsets.symmetric(
                  //               horizontal: 20, vertical: 12),
                  //         ),
                  //         icon: Icon(
                  //           Icons.camera_alt,
                  //           color: Provider.of<ThemeModeData>(context)
                  //                   .isDarkModeActive
                  //               ?  const Color.fromARGB(255, 255, 255, 255)
                  //               :  const Color.fromRGBO(54, 84, 134, 1),
                  //         ),
                  //         label: Text(
                  //           "Take Photo",
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             color: Provider.of<ThemeModeData>(context)
                  //                     .isDarkModeActive
                  //                 ?  const Color(0xFFC6E7FF)
                  //                 : const Color(0XFF819CCA),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 20),
                  //       ElevatedButton.icon(
                  //         onPressed: () async {
                  //           await predictionProvider
                  //               .pickImage(ImageSource.gallery);
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const Prediction(),
                  //             ),
                  //           );
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Provider.of<ThemeModeData>(context)
                  //                   .isDarkModeActive
                  //               ?  const Color.fromRGBO(54, 84, 134, 1)
                  //               :  const Color(0xFFC6E7FF),
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 20, vertical: 12),
                  //         ),
                  //         icon: Icon(
                  //           Icons.image,
                  //           color: Provider.of<ThemeModeData>(context)
                  //                   .isDarkModeActive
                  //               ?  const Color(0xFFC6E7FF)
                  //               :  const Color.fromRGBO(54, 84, 134, 1),
                  //         ),
                  //         label: Text(
                  //           "Import Image",
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             color: Provider.of<ThemeModeData>(context)
                  //                     .isDarkModeActive
                  //                 ?  const Color.fromARGB(255, 255, 255, 255)
                  //                 : const Color(0XFF819CCA),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      // drawer: Drawer(
      //   backgroundColor: isDarkMode
      //       ? const Color.fromRGBO(54, 84, 134, 1)
      //       : Colors.white,
      //   child: Column(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         currentAccountPicture: const CircleAvatar(
      //           backgroundColor: Colors.white,
      //           backgroundImage: AssetImage('assets/logo.png'),
      //         ),
      //         accountName: Text(
      //           "$name",
      //           style: const TextStyle(
      //               color: Color(0XFF819CCA), fontWeight: FontWeight.bold),
      //         ),
      //         accountEmail: Text(
      //           "$email",
      //           style: const TextStyle(
      //               color: Color(0XFF819CCA), fontWeight: FontWeight.bold),
      //         ),
      //         decoration: const BoxDecoration(color: Color(0xFFC6E7FF)),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.settings),
      //         title: Text(
      //           'Settings',
      //           style: TextStyle(
      //             color: isDarkMode
      //                 ? const Color(0xFFC6E7FF)
      //                 : Colors.black,
      //           ),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) {
      //                 return const MySettings();
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.logout),
      //         title: Text(
      //           'Log Out',
      //           style: TextStyle(
      //             color: isDarkMode
      //                 ? const Color(0xFFC6E7FF)
      //                 : Colors.black,
      //           ),
      //         ),
      //         onTap: () {
      //           FirebaseAuth.instance.signOut();
      //           Navigator.popAndPushNamed(context, '/login');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

Widget buildMenu({
  required BuildContext context,
  required String text,
  required VoidCallback onTap,
  required bool isDarkMode,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 15, left: 15),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color.fromRGBO(54, 84, 134, 1)
            : const Color(0xFFC6E7FF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? const Color(0xFF000000).withOpacity(0.2)
                : const Color.fromARGB(255, 97, 120, 137).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: isDarkMode
              ? const Color(0xFFC6E7FF)
              : const Color(0XFF819CCA),
        ),
      ),
    ),
  );
}
