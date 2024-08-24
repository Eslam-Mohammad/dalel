import 'package:dalel/features/OnBoarding/on_boarding_screen.dart';
import 'package:dalel/features/SplashScreen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => OnBoardingScreen(),
    ),
  ],);