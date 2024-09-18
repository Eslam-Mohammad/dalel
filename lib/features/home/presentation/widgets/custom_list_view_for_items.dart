import 'package:dalel/features/home/presentation/widgets/custom_card_for_list.dart';
import 'package:flutter/material.dart';

class CustomListViewForItems extends StatelessWidget {
  final List<dynamic> model;
  const CustomListViewForItems({
    super.key,
     required this.model,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      width: double.infinity,
      child: ListView.separated(

          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomCardForList(text: model[index].name, imagePath:model[index].imageUrl),
          separatorBuilder: (context, index) => const SizedBox(width: 6,),
          itemCount: model.length),
    );
  }
}