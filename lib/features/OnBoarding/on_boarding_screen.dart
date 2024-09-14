

import 'package:dalel/core/constants/app_colors.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_elevatedbtn.dart';
import 'package:dalel/features/OnBoarding/widgets/onboarding_body.dart';
import 'package:dalel/features/OnBoarding/widgets/skip_button.dart';
import 'package:dalel/features/OnBoarding/widgets/smooth_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 final pageController = PageController();
 int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            SkipButtonWidget(
                size: size),
            OnboardingBody(
                onChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                pageController: pageController),
            const SizedBox(
              height: 15,),
            CustomSmoothPageIndicator(pageController: pageController),
            const SizedBox(
              height: 30,),
            currentIndex==2
                ?Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomElevatedbtn(
                    onPressed: (){
                    GoRouter.of(context).pushReplacement('/signup');
                    },
                    text: "Create Account",
                  ),
                ),
                const SizedBox(
                  height: 5,),
                TextButton(
                    onPressed: (){
                      GoRouter.of(context).pushReplacement('/signin');
                    },
                    child: Text("Login Now",
                  style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,color: AppColors.primary),))
              ],
            )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomElevatedbtn(
                                onPressed: (){
                  pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
                                },
                                text: "Next",
                              ),
                ),
        
        
        
        
        
        
        
        
        
        
        
        
                ],
              ),
      ),
      );

  }
}








