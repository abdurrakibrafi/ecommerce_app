import 'package:flutter/material.dart';

class ChipView extends StatelessWidget {
  const ChipView({super.key,
  required this.chipLabel
  });


final String chipLabel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      
      padding: const EdgeInsets.all(3),
      child: Chip(label: Text(chipLabel)),
    );
  }
}