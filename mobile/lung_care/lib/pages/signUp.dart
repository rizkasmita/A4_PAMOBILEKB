import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lung_care/model/theme_mode.dart';
import 'package:lung_care/pages/auth.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPw = TextEditingController();
  final ValueNotifier<bool> _isObscureNotifier = ValueNotifier(true);

  SignUp({super.key});

  Future<void> handleSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final name = _ctrlName.value.text;
    final email = _ctrlEmail.value.text;
    final pw = _ctrlPw.value.text;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await Auth().regis(context, name, email, pw);
      Navigator.pop(context); // Tutup loading
    } catch (e) {
      Navigator.pop(context); // Tutup loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign up failed: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Provider.of<ThemeModeData>(context).isDarkModeActive
              ? const Color.fromRGBO(54, 84, 134, 100)
              : Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 130),
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
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 40),
                  width: 121,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 23,
                      color: Color(0XFF819CCA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Name Field
                _buildTextField(
                  controller: _ctrlName,
                  label: 'Name',
                ),
                // Email Field
                _buildTextField(
                  controller: _ctrlEmail,
                  label: 'Email',
                ),
                // Password Field
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _isObscureNotifier,
                    builder: (context, isObscure, child) {
                      return TextField(
                        controller: _ctrlPw,
                        obscureText: isObscure,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 162, 185, 223),
                        ),
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
                              width: 1,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF80C8F0)),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 162, 185, 223),
                            fontSize: 15,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure ? Icons.visibility_off : Icons.visibility,
                              color: const Color.fromARGB(255, 162, 185, 223),
                            ),
                            onPressed: () {
                              _isObscureNotifier.value = !_isObscureNotifier.value;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Sign Up Button
                Container(
                  width: double.infinity,
                  height: 40,
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: ElevatedButton(
                    onPressed: () => handleSubmit(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC6E7FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Sign In Redirect
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Color(0XFF819CCA)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF819CCA),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Color.fromARGB(255, 162, 185, 223),
        ),
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
              width: 1,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC6E7FF)),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 162, 185, 223),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
