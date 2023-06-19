// ignore_for_file: prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'dart:async';

import 'package:faida/view/auth/auth_start_screen.dart';
import 'package:faida/view/auth/signup_screen.dart';
import 'package:faida/view/auth/verify_otp_screen.dart';
import 'package:faida/view/auth/verify_phonenumber_screen.dart';
import 'package:flutter/material.dart';
import 'package:faida/view/auth/login_screen.dart';
import 'package:faida/authentication.dart';
import 'package:faida/productPage.dart';
import 'package:faida/profile.dart';
import 'package:faida/legal.dart';
import 'package:faida/theme/app_theme.dart';
import 'MaindashboradPage.dart';
import 'addProduct.dart';
import 'expensesPage.dart';
import 'generateReport.dart';

void main() {
  runApp(const FaidaApp());
}

class FaidaApp extends StatelessWidget {
  const FaidaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faida',
      home: const SplashScreen(),
      routes: {
        '/authenticate' : (context) => const AuthLaunchPage(),
        '/signup': (context) => const SignupPage(),
        '/verifyPhoneNumber': (context) => const VerifyPhoneNumberPage(),
        '/login': (context) => const LoginPage(),
        '/verifyOtp': (context) => const VerifyOtpPage(),
        '/authentication': (context) =>  AuthenticationPage(),
        '/legal': (context) => const LegalPage(),
        '/MaindashboardPage' : (context) => const MainDashboardPage(),
        '/productPage' : (context) => const DisplayProductsPage(),
        '/profile' : (context) => const ProfilePage(),
        '/generateReport' : (context) => SalesGeneratePage(),
        '/expensesPage' : (context) => ExpensesPage(),
        '/addProduct' : (context) => const AddProductPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/authenticate');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Faida welcomes you!!'),
      ),
    );
  }
}
