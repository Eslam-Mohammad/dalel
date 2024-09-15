import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    delayedNavigation();
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



  Future<Null> delayedNavigation() {
    return Future.delayed(const Duration(seconds: 3), () {
      if(FirebaseAuth.instance.currentUser != null)
      {
        if(FirebaseAuth.instance.currentUser!.emailVerified){
          GoRouter.of(context).pushReplacement('/home');
        }
        else{
        GoRouter.of(context).pushReplacement('/signin');
        }
      }
      else
      {
        GoRouter.of(context).pushReplacement('/onBoarding');
      }
    });
  }


}
