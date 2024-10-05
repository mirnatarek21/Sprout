import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/builders/circle_graph.dart';
import 'package:sprout/constants.dart';
import 'package:sprout/utils/home_widgets/spacing.dart';

class WorkoutLessonsCard extends StatelessWidget {
  const WorkoutLessonsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      height: 187.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/home_imgs/background_image.jpeg"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            height: 93,
            decoration: BoxDecoration(
              color: textColor.withOpacity(.6),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Body Pumping",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        "Calories Loss",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(5),
                      Row(
                        children: [
                          Text(
                            "1.250",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          horizontalspace(25),
                          Text(
                            "+4.3%",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffFF269A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: CircleGraph(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
