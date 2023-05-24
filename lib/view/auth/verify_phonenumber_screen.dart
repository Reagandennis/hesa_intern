import 'package:flutter/material.dart';

class VerifyPhoneNumberPage extends StatelessWidget {
  const VerifyPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('VERIFY YOUR NUMBER',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 60),
                  const Text("One time password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 270, // Replace with the desired width
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin:
                          const EdgeInsets.symmetric(vertical: 30),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/profile');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 4, 4, 66),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'NEXT',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ]
            ),
          ),
        )
    );
  }
}