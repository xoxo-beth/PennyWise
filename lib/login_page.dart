//import 'package:expense_tracker/splash_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login', style: Theme.of(context).textTheme.titleLarge),
            Padding(padding: EdgeInsets.all(8)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'name@email.com',
                  filled: true,
                  fillColor: Color.fromARGB(255, 150, 203, 185),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'password',
                  filled: true,
                  fillColor: Color.fromARGB(255, 150, 203, 185),
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
                  backgroundColor: Color.fromARGB(255, 150, 203, 185),
                ),
                onPressed: () {},
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
