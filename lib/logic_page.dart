import 'package:flutter/material.dart';
import 'dart:math';

class BmiLogic{
  BmiLogic({required this.height,required this.weight});
  final int height;
  final int weight;
  late double _bmi ;

  String bmiValue(){
     _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult(){
    bmiValue();
    if(_bmi>25){
      return "Overweight";
    }else if(_bmi<18.5){
      return "Underweight";
    }else{
      return "Normal";
    }
  }

  String interpretation(){
    if(_bmi>25){
      return "You have a higher than normal body weight! Try to exercise more.";
    }else if(_bmi<18.5){
      return "You have a lower than normal body weight! Try to eat a bit more.";
    }else{
      return "You have a normal body weight! Good job.";
    }
  }


}