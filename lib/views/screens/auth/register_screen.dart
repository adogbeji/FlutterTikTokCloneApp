import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/models/utils/global.dart';

import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/auth/register_screen.dart';
import 'package:tiktok_clone/views/widgets/input_text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Username, Email & Password Controllers
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  // bool showProgressBar = false;

  var authController = AuthController.instanceAuth;  // Stores instance of AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),

              Text(
                'Create Account',
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'to get started',
                style: GoogleFonts.acme(
                  fontSize: 34,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 16,),

              GestureDetector(
                onTap: () {
                  authController.chooseImageFromGallery();
                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    'assets/images/profile_avatar.jpg',
                  ),
                  backgroundColor: Colors.black,
                ),
              ),

              const SizedBox(height: 30,),

              // USERNAME INPUT FIELD
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: userNameTextEditingController,
                  labelString: 'Username',
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(height: 15,),

              // EMAIL INPUT FIELD
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: emailTextEditingController,
                  labelString: 'Email',
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(height: 15,),

              // PASWORD INPUT FIELD
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: InputTextWidget(
                  textEditingController: passwordTextEditingController,
                  labelString: 'Password',
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              const SizedBox(height: 12,),

              // LOGIN BUTTON
              showProgressBar == false ?
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 38,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        // setState(() {
                        //   showProgressBar = true;
                        // });

                        if (authController.profileImage != null 
                              && userNameTextEditingController.text.isNotEmpty
                              && emailTextEditingController.text.isNotEmpty
                              && passwordTextEditingController.text.isNotEmpty
                           ) {
                            setState(() {
                              showProgressBar = true;
                            });

                            // Create new user account
                            authController.createAccountForNewUser(
                                authController.profileImage!, 
                                userNameTextEditingController.text, 
                                emailTextEditingController.text,
                                passwordTextEditingController.text,
                              );
                            }

                        // // Create new user account
                        // authController.createAccountForNewUser(
                        //   authController.profileImage!, 
                        //   userNameTextEditingController.text, 
                        //   emailTextEditingController.text,
                        //   passwordTextEditingController.text,
                        // );
                      },
                      child: const Center(
                        child: Text('Sign Up', style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                    ),
                  ),

                  const SizedBox(height: 7,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?', style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),),

                      InkWell(
                        onTap: () {
                          // Sends user to login screen
                          Get.to(const LoginScreen());
                        },
                        child: const Text('Log In', style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
                  ),
                ],
              ): Container(
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