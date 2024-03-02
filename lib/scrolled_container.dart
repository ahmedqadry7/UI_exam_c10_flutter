// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ScrolledContainer extends StatelessWidget {
  String word;
  bool isSelected = false;
  ScrolledContainer({super.key, required this.word, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected ? Color(0xFFF4EBFF) : Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Center(child: Text(word)),
    );
  }
}
