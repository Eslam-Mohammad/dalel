import 'package:dalel/core/constants/app_colors.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_elevatedbtn.dart';
import 'package:dalel/core/widgets/email_text_field.dart';
import 'package:dalel/core/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child:SingleChildScrollView(
          child: Column(
            
            children: [
               Container(
                height: 290,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color:AppColors.primary,
                ),
                  child: Stack(
                    children: [
                      Positioned(

                        top: 120,
                        left: size.width/2-40,
                        child: const Text("Dalel",
                          style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),

                      ),
                      Positioned(
                        top: 188,
                        left: 0,
                        child: SvgPicture.asset("assets/images/pyramidsvec.svg"),
          
                      ),
                      Positioned(
                        top: 161,
                        right: 0,
                        child: SvgPicture.asset("assets/images/buildingvec.svg"),
          
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    // welcome text
                    Padding(
                      padding: const EdgeInsets.only(top:30.0,bottom: 40.0 ),
                      child: Text("Welcome Back !",
                        style: AppTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.w600,fontSize: 30.0),),
                    ),
                    //Email Field
                    CustomEmailTextField(emailController: emailController, color: AppColors.primary),
                    const SizedBox(height: 25,),
                    //Password Field
                    CustomPasswordTextField(passwordController: passwordController, color: AppColors.primary),
                    const SizedBox(height: 15,),
                    //forget password
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: (){},
                          child: Text("Forgot Password ?",
                            style: AppTextStyles.poppins500style24.copyWith(color: AppColors.fontSecondaryColor,fontSize: 16.0),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100,),
                    //Login Button
                    CustomElevatedbtn(text: "Sign In", onPressed: (){}),
                    const SizedBox(height: 15,),
                    //Don't have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?",style: TextStyle(fontSize: 16.0),),
                        const SizedBox(width: 5,),
                        TextButton(onPressed: (){
                          GoRouter.of(context).pushReplacement("/signup");
                        }, child: const Text("Sign Up",style: TextStyle(color: AppColors.primary,fontSize: 16.0),)),
                      ],
                    )
              
                  ],
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
