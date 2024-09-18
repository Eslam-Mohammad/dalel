import 'package:dalel/core/constants/app_images_path.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsItems extends StatelessWidget {
  const HistoricalPeriodsItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, "/ancientEgypt");
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: 160,
            height: 95,
            child:Image.asset(Assets.imagesAncientEgypt),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.pushNamed(context, "/islamicEra");
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: 160,
            height: 95,
            child:Image.asset(Assets.imagesIslamicEra),
          ),
        ),
      ],
    );
  }
}