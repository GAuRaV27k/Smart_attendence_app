import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/theme.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double fieldWidth = MediaQuery.of(context).size.width * 0.88;

    return Scaffold(
      body: Container(
        width: double.infinity,
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
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontFamily: 'disney',
                  ),
                ),

                const SizedBox(height: 40),

                buildTextField(fieldWidth, "Email"),
                const SizedBox(height: 16),

                buildTextField(fieldWidth, "Password", obscure: true),
                const SizedBox(height: 25),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3D5AFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black87,fontFamily: 'disney'),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: const Color(0xFF3D5AFE),
                          fontWeight: FontWeight.w600,
                            fontFamily: 'disney',
                        ),
                      ),
                    ),
                    // const SizedBox(height: 20),


                  ],
                ),
                const SizedBox(height: 20),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/image/google-icon-logo-svgrepo-com.svg",width: 34,height: 34,),
                    const SizedBox(width: 20),
                    Image.asset("assets/image/2023_Facebook_icon.svg.png",width: 34,height: 34),
                    const SizedBox(width: 20),
                    Image.asset("assets/image/Microsoft_Logo_512px.png" ,width: 34,height: 34,),

                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(double width, String hint, {bool obscure = false}) {
    return Container(

        width: width,
        height: 55,
        decoration: BoxDecoration(

          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFFFDF00), width: 1),
        ),
        child: TextField(
            obscureText: obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400],fontFamily: 'sub_disney'),
            )));
  }
}
