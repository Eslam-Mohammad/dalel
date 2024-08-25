
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/theme/app_theme.dart';

import 'package:flutter/material.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

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

