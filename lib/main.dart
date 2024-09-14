
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/services/bloc_observer.dart';
import 'package:dalel/core/services/service_locator_getit.dart';
import 'package:dalel/core/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options:FirebaseOptions(
        apiKey: 'AIzaSyB96agzMzCa6DsToV0lDPxVhA0auTx8-1U',
        appId: '1:974290311459:android:c190a218543eeaa0849496',
        messagingSenderId: '974290311459',
        projectId: 'mytestapps-83a40',


        storageBucket: 'mytestapps-83a40.appspot.com',

      ),
    );
  } catch (e) {
    print('Error initializing Firebase #@#@#@#: $e');
  }

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  Bloc.observer = const AppBlocObserver();


  setup();

  runApp(const DalelApp());
}

class DalelApp extends StatelessWidget {
  const DalelApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeDataLight ,

      routerConfig: router,
      debugShowCheckedModeBanner: false,



    );
  }
}

