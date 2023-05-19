// ignore_for_file: prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hesa/login_page.dart';
import 'package:hesa/authentication.dart';
import 'package:hesa/productPage.dart';
import 'package:hesa/profile.dart';
import 'package:hesa/signup_page.dart';
import 'package:hesa/legal.dart';

import 'MaindashboradPage.dart';
import 'addProduct.dart';
import 'expensesPage.dart';
import 'generateReport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hesa',
      home: const SplashScreen(),
      routes: {
        '/signup': (context) => const SignupPage(),
        '/login': (context) => const LoginPage(),
        '/authentication': (context) => const AuthenticationPage(),
        '/legal': (context) => const LegalPage(),
        '/MaindashboardPage' : (context) => const MainDashboardPage(),
        '/productPage' : (context) => const DisplayProductsPage(),
        '/profile' : (context) => const ProfilePage(),
        '/generateReport' : (context) => SalesGeneratePage(),
        '/expensesPage' : (context) => ExpensesPage(),
        '/addProduct' : (context) => const AddProductPage(),
      },
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
      Navigator.of(context).pushReplacementNamed('/signup');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hesa welcomes you!!'),
      ),
    );
  }
}
