import 'package:dalel/core/constants/app_colors.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCardForList extends StatelessWidget {
  const CustomCardForList({required this.text,required this.imagePath, super.key});
  final String imagePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: Card(

       clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: Image.network(imagePath,fit: BoxFit.fill,)),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 100,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppins500style24.copyWith(fontSize: 14,color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
