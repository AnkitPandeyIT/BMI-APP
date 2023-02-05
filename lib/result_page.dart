import 'package:bmii/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'logic_page.dart';

class ResultPage extends StatelessWidget {

  BmiLogic calculate = BmiLogic(height: kHeight, weight: kWeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR",style: kTitleText,)),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                colour: container_color,
            cardChild:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(calculate.bmiResult(),style: TextStyle(
                  color: Color(0xFF24D876),
                  fontSize: 22, fontWeight: FontWeight.bold,
                ),),
                Text(calculate.bmiValue(),style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 100,
                ),),
                Text(calculate.interpretation(),style: TextStyle(
                  fontSize: 22,
                ), textAlign: TextAlign.center,)
              ],
            ),
          )),
          BottomButton(label: "RE-CALCULATE", onPress: (){
            Navigator.pop(context);
          })

        ],
      ),
    );
  }
}
