import 'package:dalel/core/constants/app_colors.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:dalel/core/services/service_locator_getit.dart';
import 'package:dalel/core/widgets/custom_elevatedbtn.dart';
import 'package:dalel/core/widgets/email_text_field.dart';
import 'package:dalel/core/widgets/password_text_field.dart';
import 'package:dalel/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
 final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
 final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> dispose(){
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return Future.value(true);
  }

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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    controller: firstNameController,
                    decoration: InputDecoration(
                      focusColor: AppColors.primary,
                      labelStyle: const TextStyle(color: AppColors.primary),
                      labelText: "First Name",

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primary,width: 2.0),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primary,width: 2.0),),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primary,width: 2.0),),

                    ),
                  ),
                  const SizedBox(height: 25,),
                  //Last Name Field
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: AppColors.primary),
                      labelText: "Last Name",

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primary,width: 2.0),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primary,width: 2.0),),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: AppColors.primary,width: 2.0),),


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
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                    return Row(
                    children: [
                      Checkbox(value:getIt<AuthCubit>().isAgreed, onChanged: (value){
                        getIt<AuthCubit>().agreeToTerms(value!);


                      }),
                      const SizedBox(width: 10,),
                      const Text("I agree to the terms and conditions",
                      ),
                    ],
                  );
  },
),
                  const SizedBox(height: 60,),
                  //Sign Up Button

                  BlocConsumer<AuthCubit, AuthState>(
                   listener: (context, state) {
                      if(state is SignUpSuccess){
                        GoRouter.of(context).pushReplacement("/signin");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verify your email")));
                      }else if(state is SignUpFailed){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                      }

                    },
                     builder: (context, state) {
                     return state is SignUploading?
                  const CircularProgressIndicator(color: AppColors.primary,):
                     CustomElevatedbtn(text: "Sign Up", onPressed: (){
                    if(formKey.currentState!.validate()){
                      getIt<AuthCubit>().signUp(emailController.text, passwordController.text);


                    }

                  });
  },
),


                  const SizedBox(height: 15,),
                  //Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",style: TextStyle(fontSize: 16.0),),
                      const SizedBox(width: 5,),
                       TextButton(onPressed: (){
                        GoRouter.of(context).pushReplacement("/signin");
                      }, child: const Text("Sign In",style: TextStyle(color: AppColors.primary,fontSize: 16.0),)),
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
