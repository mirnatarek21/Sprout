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
    this.onCheckboxChanged,
    this.selectedBackgroundImage,
    this.imagePath,
    this.isCentered = false,
    this.showCheckbox = true,
  }) : super(key: key);

  final Card3D card;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final bool isSelected;
  final ValueChanged<bool>? onCheckboxChanged;
  final String? selectedBackgroundImage;
  final String? imagePath;
  final bool isCentered; // Determines if text should be centered
  final bool showCheckbox; // Determines if checkbox should be shown

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
              if (imagePath != null && imagePath!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: isCentered
                      ? Center(  // Center text if `isCentered` is true
                    child: Text(
                      card.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  )
                      : Align(  // Left-align text if `isCentered` is false
                    alignment: Alignment.centerLeft,
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
              ),
              if (showCheckbox)  // Only show checkbox if `showCheckbox` is true
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCheckbox(
                    value: isSelected,
                    onChanged: onCheckboxChanged!,
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
