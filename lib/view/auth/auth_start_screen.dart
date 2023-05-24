// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:faida/services/my_image.dart';
import 'package:flutter/material.dart';

class AuthLaunchPage extends StatelessWidget {
  const AuthLaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 100, height: 100,
                      child: MyImage(assetImage: AssetImage('assets/faida_app_logo.png')),
                    ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 4, 4, 66),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 90, vertical: 16),
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
                          Navigator.of(context).pushNamed('/signup');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              width: 2, color: Color.fromARGB(255, 4, 4, 66)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 16),
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
            ]
          )

        ),
      ),
    );
  }
}
