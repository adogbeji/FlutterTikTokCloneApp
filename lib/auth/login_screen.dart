import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/auth/register_screen.dart';

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

              const SizedBox(
                height: 30,
              ),

              // EMAIL INPUT FIELD
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  labelString: 'Email',
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // PASSWORD INPUT FIELD
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  labelString: 'Password',
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // LOGIN BUTTON
              showProgressBar == false
                  ? Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 54,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                showProgressBar = true;
                              });
                            },
                            child: const Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 15,),

                            InkWell(
                              onTap: () {
                                // Send user to register screen
                                Get.to(const RegisterScreen());
                              },
                              child: const Text(
                                'Sign Up Now',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(
                    child: const SimpleCircularProgressBar(
                      progressColors: [
                        Colors.green,
                        Colors.blueAccent,
                        Colors.red,
                        Colors.amber,
                        Colors.purpleAccent,
                      ],
                      animationDuration: 3,
                      backColor: Colors.white38,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
