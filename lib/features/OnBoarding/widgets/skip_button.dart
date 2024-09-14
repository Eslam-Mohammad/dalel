import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:dalel/core/constants/app_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.08,
            right: isArabic ? size.width * 0.2 : 0,
            left: isArabic ? 0 : size.width * 0.2,
          ),
          child: TextButton(
            child: Text(
              'Skip',
              style: AppTextStyles.poppins500style24
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
            onPressed: () {
              GoRouter.of(context).pushReplacement('/signin');
            },
          ),
        ),
      ],
    );
  }
}