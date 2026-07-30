//import 'package:expense_tracker/splash_page.dart';
import 'package:expense_tracker/home_page.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool seePassword = false;

  void _checkDetails() {
    String typedEmail = _emailController.text;
    String typedPassword = _passwordController.text;
    if (typedEmail == '') {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your email')));
    } else if (typedPassword == '') {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter your password')));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: ((context) => HomePage())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login', style: Theme.of(context).textTheme.titleLarge),
            Padding(padding: EdgeInsets.all(8)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'name@email.com',
                  filled: true,
                  fillColor: AppColors.lightGreen,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: _passwordController,
                obscureText: !seePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'password',
                  filled: true,
                  fillColor: AppColors.lightGreen,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        seePassword = !seePassword;
                      });
                    },
                    icon: Icon(
                      seePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  //fillColor: Color(0xFF10B981),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Text('Forgot password?'),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightGreen,
                ),
                onPressed: () {
                  _checkDetails();
                },
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
