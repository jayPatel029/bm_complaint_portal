import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'screens.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Get.offAll(const AllComplaints());

    } on FirebaseAuthException catch (e) {
      String errorMessage = _mapFirebaseAuthErrorCode(e.code);
      Get.snackbar("Authentication Error", errorMessage,
          colorText: Colors.white, backgroundColor: Colors.orange[700]);
      print('FirebaseAuthException: $errorMessage');

      if (e.code == 'wrong-password') {
        passwordController.clear();
      }
    } on PlatformException catch (e) {
      Get.snackbar("Platform Error", e.message ?? "An unknown error occurred");
      print('PlatformException: ${e.message}');
    } catch (e) {
      Get.snackbar("Error", "An unexpected error occurred",
          colorText: Colors.white, backgroundColor: Colors.orange[700]);
      print('Unexpected Error: $e');
    }


    setState(() {
      isLoading = false;
    });
  }

  String _mapFirebaseAuthErrorCode(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Incorrect password';
      case 'user-disabled':
        return 'User account has been disabled';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Login operation is not allowed';
      default:
        return 'An unknown authentication error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Complaint Portal",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]),
                  )
                ],
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/bm.png"))),
              ),
          
              // SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomTextfield(
                hint: 'Email',
                controller: emailController,
              ),
              CustomTextfield(
                hint: 'Secret id',
                controller: passwordController,
              ),
          
              SizedBox(
                height: 10,
              ),
              CustomButton(
                Bname: 'Log In',
                onTap: () {
                  login();
                },
                height: 55,
                width: 360,
              ),
          
              SizedBox(
                height: 30,
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to Music Lister?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
          
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
