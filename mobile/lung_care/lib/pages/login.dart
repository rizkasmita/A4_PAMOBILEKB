import 'package:flutter/material.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:lung_care/pages/auth.dart';
import 'package:lung_care/pages/homepage.dart';
import 'package:lung_care/pages/signUp.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final ValueNotifier<bool> _isObscureNotifier = ValueNotifier(true);

  Login({super.key});

  Future<void> handleSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;

    // loading
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      final userData = await Auth().login(context, email, password);

      Navigator.pop(context); // tutup loading
      if (userData != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(userData: userData),
            ));
      }
    } catch (e) {
      Navigator.pop(context); // tutup loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Provider.of<ThemeModeData>(context).isDarkModeActive
              ? const Color.fromRGBO(54, 84, 134, 100)
              : Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 130),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFC6E7FF),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0XFF819CCA),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 162, 185, 223)),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 162, 185, 223),
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 162, 185, 223), width: 1),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF80C8F0))),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 162, 185, 223),
                        fontSize: 15),
                  ),
                  controller: _ctrlEmail,
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _isObscureNotifier,
                  builder: (context, isObscure, child) {
                    return TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 162, 185, 223)),
                      controller: _ctrlPassword,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 162, 185, 223),
                            width: 2,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 162, 185, 223),
                              width: 1),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF80C8F0)),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 162, 185, 223),
                            fontSize: 15),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color.fromARGB(255, 162, 185, 223),
                          ),
                          onPressed: () {
                            _isObscureNotifier.value =
                                !_isObscureNotifier.value;
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => handleSubmit(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC6E7FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Color(0XFF819CCA)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF819CCA),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}