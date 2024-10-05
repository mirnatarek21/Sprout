import 'package:flutter/material.dart';
import 'class_card3d.dart';

class Card3DWidget extends StatelessWidget {
  const Card3DWidget({
    Key? key,
    required this.card,
    this.width = 300,
    this.height = 200,
    this.color = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  final Card3D card;
  final double width;
  final double height;
  final Color color;
  final Color textColor;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  card.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              // Check if the image is provided
              if (card.image != null && card.image!.isNotEmpty) // Ensure image is not null or empty
                Expanded(
                  child: Image.asset(
                    card.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
              else
                Expanded(
                  child: Container(
                    color: Colors.grey[300], // Placeholder color
                    alignment: Alignment.center,
                    child: Text(
                      'No Image Available',
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}



class Card23DWidget extends StatelessWidget {
  const Card23DWidget({
    Key? key,
    required this.card,
    this.width = 100,
    this.height = 100,
    this.color = Colors.white,
    this.isSelected = false,
  }) : super(key: key);

  final Card23D card;
  final double width;
  final double height;
  final Color color;
  final bool isSelected;

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
          color: color,
          child: Center(
            child: AnimatedScale(
              scale: isSelected ? 1.2 : 1.0,
              duration: Duration(milliseconds: 300),
              // Removed the Image.asset widget
              child: Text(
                'Your Text Here', // You can add some text if needed
                style: TextStyle(
                  color: Colors.black, // Customize the text style as needed
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
