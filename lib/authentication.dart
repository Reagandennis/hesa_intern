// ignore_for_file: prefer_const_declarations, avoid_print, use_build_context_synchronously, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String otpCode = '';

  void generateOTP() {
    // Generate a 4-digit OTP code
    otpCode = (Random().nextInt(9000) + 1000).toString();
    print('Generated OTP: $otpCode');
  }

  Future<void> sendOtp(BuildContext context) async {
    final String phoneNumber = phoneNumberController.text;

    // Replace with your actual SMS gateway URL
    final String smsGatewayUrl = 'https://api.example.com/sms/send';
    final String apiKey = 'YOUR_API_KEY';

    final String message = 'Your OTP is: $otpCode';

    final Uri uri = Uri.parse(smsGatewayUrl);
    final http.Response response = await http.post(
      uri,
      body: {
        'api_key': apiKey,
        'phone_number': phoneNumber,
        'message': message,
      },
    );

    if (response.statusCode == 200) {
      print('OTP sent to $phoneNumber: $otpCode');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // ignore: prefer_const_constructors
            title: Text('OTP Sent'),
            content: const Text('Please check your phone for the OTP.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print('Failed to send OTP');
      // Handle error condition, show error message, etc.
    }
  }

  void verifyOtp(BuildContext context) {
    final String enteredOtp = otpController.text;

    if (enteredOtp == otpCode) {
      // Verification successful, perform necessary actions
      // For example, navigate to the next screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('OTP Verification Failed'),
            content: const Text('Invalid OTP. Please try again.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter your phone number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 100,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        generateOTP();
                        sendOtp(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 4, 66),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 58,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'GET OTP',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.3),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.3),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        verifyOtp(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 4, 66),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'VERIFY',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
