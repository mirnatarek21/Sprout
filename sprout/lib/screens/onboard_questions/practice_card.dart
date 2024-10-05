import 'package:flutter/material.dart';
import 'package:sprout/constants.dart';
import '../../utils/class_card3d.dart';
import '../../utils/goal_card_widget.dart';

class BuildPracticeCard extends StatelessWidget {
  final String practiceKey;
  final String text;
  final bool isSelected;
  final Function(String) toggleSelection;

  const BuildPracticeCard({
    Key? key,
    required this.practiceKey,
    required this.text,
    required this.isSelected,
    required this.toggleSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toggleSelection(practiceKey),
      child: GoalCard3DWidget(
        card: Card3D(
          text: text,
        ),
        color: isSelected ? Colors.transparent : Colors.white,
        textColor: isSelected ? Colors.black : textColor,
        isSelected: isSelected,
        onCheckboxChanged: (bool isSelected) {
          toggleSelection(practiceKey);
        },
        selectedBackgroundImage: isSelected ? 'assets/images/small_pattern.png' : null,
      ),
    );
  }
}
