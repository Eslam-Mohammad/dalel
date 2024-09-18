import 'package:dalel/core/widgets/custom_header_widget.dart';
import 'package:dalel/features/home/presentation/manager/home_cubit.dart';
import 'package:dalel/features/home/presentation/manager/home_states.dart';

import 'package:dalel/features/home/presentation/widgets/custom_list_view_for_items.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_items.dart';
import 'package:dalel/features/home/presentation/widgets/loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const CustomHeaderWidget(text: "Historical Periods"),
                const SizedBox(
                  height: 15,
                ),
                state is LoadingState ? LoadingList():
                const HistoricalPeriodsItems(),
                const SizedBox(
                  height: 30,
                ),


                const CustomHeaderWidget(text: "Historical Characters"),
                const SizedBox(
                  height: 15,
                ),
                ///// historical characters list view
                state is LoadingState ? LoadingList():
                CustomListViewForItems(model:HomeCubit.get(context).historicalCharacters),
                const SizedBox(
                  height: 30,
                ),


                const CustomHeaderWidget(text: "Historical Souvenirs"),
                const SizedBox(
                  height: 15,
                ),
                ///// historical souvenirs list view
                state is LoadingState ? LoadingList():
                CustomListViewForItems(model:HomeCubit.get(context).historicalSouvenirs),

              ],
            ),
          ),
        );
      },
    );
  }
}






