import 'package:dalel/core/constants/app_images_path.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.pageController,
    required this.onChanged,
  });
    final Function(int) onChanged;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 570,
      child: PageView(
        onPageChanged: onChanged,
        controller: pageController,
        children: [
          Column(
            children: [
              SvgPicture.asset(Assets.imagesFrame1,),
              const SizedBox(height: 50,),

               RichText(text:const TextSpan(
                text: "Explore The history with ",
                style: AppTextStyles.poppins500style24,
                children: [
                  TextSpan(
                      text: "\n   Dalel in a smart way",
                      style: AppTextStyles.poppins500style24),
                ],
              )),
              const SizedBox(height: 20,),
              RichText(text: TextSpan(
                  text: "    Using our app's history libraries",
                  style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: "\nyou can find many historical periods",
                      style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,fontWeight: FontWeight.w300),
                    )
                  ]
              ),),



            ],
          ),
          Column(
            children: [
              SvgPicture.asset(Assets.imagesFrame2),
              const SizedBox(height: 50,),

              RichText(text: const TextSpan(
                text: "From every place",
                style: AppTextStyles.poppins500style24,
                children: [
                   TextSpan(
                      text: "\n      on earth",
                      style: AppTextStyles.poppins500style24),
                ],
              )),
              const SizedBox(height: 20,),
              RichText(text: TextSpan(
                  text: "A big variety of ancient places",
                  style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: "\n       from all over the world",
                      style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,fontWeight: FontWeight.w300),
                    )
                  ]
              ),),



            ],
          ),
          Column(
            children: [
              SvgPicture.asset(Assets.imagesFrame3),
              const SizedBox(height: 50,),

              RichText(text: const TextSpan(
                text: "Using modern AI technology",
                style: AppTextStyles.poppins500style24,
                children: [
                  TextSpan(
                      text: "\n  for better user experience",
                      style: AppTextStyles.poppins500style24),
                ],
              )),
              const SizedBox(height: 20,),
              RichText(text: TextSpan(
                  text: "AI provide recommendations and helps",
                  style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: "\n    you to continue the search journey",
                      style: AppTextStyles.poppins500style24.copyWith(fontSize: 16.0,fontWeight: FontWeight.w300),
                    )
                  ]
              ),),
            ],
          ),


        ],
      ),
    );
  }
}