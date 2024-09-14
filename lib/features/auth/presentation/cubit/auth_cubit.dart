
import 'package:dalel/features/auth/presentation/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool? isAgreed = false;
  void agreeToTerms(bool value) {
    isAgreed = value;
    emit(CheckAuth());
  }
  void  signUp(String email, String password) async{
    emit(SignUploading());
    try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailed(message: 'The password provided is too weak.'));

      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailed(message: 'The account already exists for that email.'));

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

      } else if (e.code == 'wrong-password') {
        emit(SignInFailed(message: 'Wrong password provided for that user.'));

      }
    } catch (e) {
      emit(SignInFailed(message: e.toString()));

    }

  }



}
