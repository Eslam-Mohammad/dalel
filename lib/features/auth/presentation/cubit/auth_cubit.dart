
import 'package:dalel/features/auth/presentation/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool? isAgreed = false;
  void agreeToTerms(bool value) {
    isAgreed = value;
    emit(CheckAuth());
  }


  void verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }



  void  signUp(String email, String password) async{
    emit(SignUploading());
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
       verifyEmail();
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
      {
        emit(SignUpFailed(message: 'The password provided is too weak.'));

      }
      else if (e.code == 'email-already-in-use')
      {
        emit(SignUpFailed(message: 'The account already exists for that email.'));

      }
      else{
        emit(SignUpFailed(message: e.toString()));
      }

    } catch (e) {
      emit(SignUpFailed(message: e.toString()));

    }

  }


void signIn(String email, String password) async{
    emit(SignInLoading());
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailed(message: 'No user found for that email.'));

      }
      else if (e.code == 'wrong-password')
      {
        emit(SignInFailed(message: 'Wrong password provided for that user.'));

      }
      else{
        emit(SignInFailed(message: "check email or password"));
      }
    } catch (e) {
      emit(SignInFailed(message: e.toString()));

    }

  }


  void resetPassword(String email) async{
    emit(ResetPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ResetPasswordFailed(message: 'No user found for that email.'));

      }
      else{
        emit(ResetPasswordFailed(message: e.toString()));
      }
    } catch (e) {
      emit(ResetPasswordFailed(message: e.toString()));

    }

  }





}
