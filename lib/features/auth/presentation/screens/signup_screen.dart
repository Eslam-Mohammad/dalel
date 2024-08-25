import 'package:dalel/core/constants/app_colors.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_elevatedbtn.dart';
import 'package:dalel/core/widgets/email_text_field.dart';
import 'package:dalel/core/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
 final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
 final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  //Welcome Text
                  Padding(
                    padding: const EdgeInsets.only(top:120 ),
                    child: Text("Welcome !",
                    style: AppTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.w600,fontSize: 30.0),),
                  ),
                  const SizedBox(height: 40,),
                  //First Name Field
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      focusColor: AppColors.primary,
                      labelStyle: TextStyle(color: AppColors.primary),
                      labelText: "First Name",

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.primary,width: 2.0),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.primary,width: 2.0),),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.primary,width: 2.0),),

                    ),
                  ),
                  const SizedBox(height: 25,),
                  //Last Name Field
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: AppColors.primary),
                      labelText: "Last Name",

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.primary,width: 2.0),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.primary,width: 2.0),),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.primary,width: 2.0),),


                    ),
                  ),
                  const SizedBox(height: 25,),
                  //Email Field
                  CustomEmailTextField(emailController: emailController, color: AppColors.primary),
                  const SizedBox(height: 25,),
                  //Password Field
                  CustomPasswordTextField(passwordController: passwordController, color: AppColors.primary),
                  const SizedBox(height: 25,),
                  //Terms and Conditions
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value){}),
                      SizedBox(width: 10,),
                      Text("I agree to the terms and conditions",
                      ),
                    ],
                  ),
                  const SizedBox(height: 60,),
                  //Sign Up Button
                  CustomElevatedbtn(text: "Sign Up", onPressed: (){}),
                  const SizedBox(height: 15,),
                  //Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(fontSize: 16.0),),
                      SizedBox(width: 5,),
                      TextButton(onPressed: (){}, child: Text("Sign In",style: TextStyle(color: AppColors.primary,fontSize: 16.0),)),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
