
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _gender = 0;
              });
              widget.onChange(_gender);
            },
            child: Image.asset(
              AssetsData.male,
              width: 120,
              height: 250,
              fit: BoxFit.contain,
              color: _gender == 0 ? Colors.grey[200] : null,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            },
            child: Image.asset(
              AssetsData.female,
              width: 120,
              height: 250,
              fit: BoxFit.contain,
              color: _gender == 1 ? Colors.grey[200] : null,
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ],
      ),
    );
  }
}