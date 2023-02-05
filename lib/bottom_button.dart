import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.label,required this.onPress});

  final String label;
  void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(label,style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 25,
          ),),
        ),
        margin: EdgeInsets.only(top: 10),

        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}