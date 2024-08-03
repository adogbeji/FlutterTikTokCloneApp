import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:tiktok_clone/views/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Email & Password Controllers
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),

              Image.asset(
                'assets/images/tiktok.png',
                width: 200,
              ),

              Text(
                'Welcome',
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Glad to see you!',
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30,),

              // EMAIL INPUT FIELD
              InputTextWidget(
                textEditingController: emailTextEditingController,
                labelString: 'Email',
                iconData: Icons.email_outlined,
                isObscure: false,
              ),

              // PASWORD INPUT FIELD
              InputTextWidget(
                textEditingController: passwordTextEditingController,
                labelString: 'Password',
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
