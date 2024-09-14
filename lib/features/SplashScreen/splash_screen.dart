import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayedNvigation();
  }




  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text('Dalel',
        style: AppTextStyles.pacifico400style64,),
      ),
    );
  }



  Future<Null> delayedNvigation() {
    return Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement('/onBoarding');
    });
  }


}
