import 'package:dalel/core/constants/app_colors.dart';
import 'package:dalel/core/constants/app_text_styles.dart';
import 'package:dalel/features/home/presentation/manager/home_cubit.dart';
import 'package:dalel/features/home/presentation/manager/home_states.dart';

import 'package:dalel/features/home/presentation/widgets/menu_btn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF6B4B3E),
                Color(0xFFF8F4F9),
              ],
            ),
          ),
        )),
        appBar: AppBar(
          leading: IconButton(
            icon: CustomPaint(
              size: const Size(24, 24),
              painter: TwoLineMenuIconPainter(),
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Dalel",
                style: AppTextStyles.pacifico400style64.copyWith(fontSize: 22),
              ),
            ),
          ],
        ),
        body: HomeCubit.get(context).appScreens[HomeCubit.get(context).currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            HomeCubit.get(context).changeIndex(index);
          },
          currentIndex: HomeCubit.get(context).currentIndex,
          iconSize: 25.0,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              activeIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.primary,
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
