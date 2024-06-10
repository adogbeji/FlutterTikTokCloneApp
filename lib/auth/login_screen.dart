import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:tiktok_clone/widgets/input_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Email & Password Controllers
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),

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
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30,),
            
            // EMAIL INPUT FIELD  
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20,),
              child: InputTextWidget(
                textEditingController: emailTextEditingController,
                labelString: 'Email',
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
            ),

            const SizedBox(height: 25,),

            // PASSWORD INPUT FIELD  
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20,),
              child: InputTextWidget(
                textEditingController: emailTextEditingController,
                labelString: 'Password',
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),

            // LOGIN BUTTON
            showProgressBar == false ?
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 54,
                ),
              ],
            ): Container(),
          ],
        ),
      ),
    ),);
  }
}
