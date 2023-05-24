// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                 child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/MaindashboardPage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 4, 66),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("or"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.3),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 4, 4, 66)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 4, 4, 66),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
