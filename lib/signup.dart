import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.of(context).size.width * 0.88;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEEE9FF),
              Color(0xFFF8F6FF),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TITLE TEXT
                const Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'disney',
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'disney',
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),

                // FULL NAME
                buildTextField(fieldWidth, "Full Name"),
                const SizedBox(height: 16),

                // USER NAME
                buildTextField(fieldWidth, "User Name"),
                const SizedBox(height: 16),

                // EMAIL
                buildTextField(fieldWidth, "Email id"),
                const SizedBox(height: 16),

                // PASSWORD
                buildTextField(fieldWidth, "Password", obscure: true),
                const SizedBox(height: 30),

                // CREATE BUTTON
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D5AFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                          fontFamily: 'disney'
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "or sign up with",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                      fontFamily: 'sub_disney'
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/image/google-icon-logo-svgrepo-com.svg",
                      width: 34,
                      height: 34,
                    ),
                    const SizedBox(width: 28),
                    Image.asset(
                      "assets/image/2023_Facebook_icon.svg.png",
                      width: 34,
                      height: 34,
                    ),
                    const SizedBox(width: 28),
                    Image.asset(
                      "assets/image/Microsoft_Logo_512px.png",
                      width: 34,
                      height: 34,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------
  // Reusable textfield widget (clean & premium)
  // ----------------------------------------------
  Widget buildTextField(double width, String hint, {bool obscure = false}) {
    return Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFFFDF00),width: 1),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
              fontFamily: 'sub_disney'
          ),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
