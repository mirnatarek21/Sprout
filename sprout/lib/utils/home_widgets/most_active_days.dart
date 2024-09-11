import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/utils/home_widgets/days_tiles.dart';
import 'package:sprout/utils/home_widgets/spacing.dart';

class MostActiveCard extends StatelessWidget {
  const MostActiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: 330.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: buttonColor,
          width: .7,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: 28.w,
          left: 23.w,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Most Active",
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Thursday",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            horizontalspace(19),
            const DaysTile(
              txt: "Th",
              height: 37,
              color: buttonColor,
            ),
            horizontalspace(17),
            const DaysTile(
              txt: "Fr",
              height: 31,
            ),
            horizontalspace(17),
            const DaysTile(
              txt: "Sa",
              height: 29,
            ),
            horizontalspace(17),
            const DaysTile(
              txt: "Su",
              height: 17,
            ),
            horizontalspace(17),
            const DaysTile(
              txt: "Mo",
              height: 23,
            ),
            horizontalspace(17),
            const DaysTile(
              txt: "Tu",
              height: 31,
            ),
            horizontalspace(17),
            const DaysTile(
              txt: "We",
              height: 27,
            ),
          ],
        ),
      ),
    );
  }
}
