import 'package:flutter/material.dart';
import 'class_card3d.dart';

class GoalCard3DWidget extends StatelessWidget {
  const GoalCard3DWidget({
    Key? key,
    required this.card,
    this.width = 400,
    this.height = 150,
    this.color = Colors.white,
    this.textColor = Colors.black,
    required this.isSelected,
    required this.onCheckboxChanged,
    this.selectedBackgroundImage,
  }) : super(key: key);

  final Card3D card;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final bool isSelected;
  final ValueChanged<bool> onCheckboxChanged;
  final String? selectedBackgroundImage; // Add this for background image

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15.0);
    return PhysicalModel(
      elevation: 10,
      borderRadius: border,
      color: color,
      child: ClipRRect(
        borderRadius: border,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: isSelected && selectedBackgroundImage != null
                ? DecorationImage(
                    image: AssetImage(selectedBackgroundImage!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  card.image,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    card.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomCheckbox(
                  value: isSelected,
                  onChanged: onCheckboxChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: value ? Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 18.0,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}
