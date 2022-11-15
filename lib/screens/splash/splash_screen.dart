import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopify/shared/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Modular.to.pushNamed('/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: shopfyGreen,
      body: Center(
        child: Icon(
          Icons.shopify_sharp,
          size: 200,
          color: Colors.white,
        ),
      ),
    );
  }
}
