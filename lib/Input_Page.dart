import 'package:bmii/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';

enum Gender{
  male,
  Female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

   upDateColor(Gender selectedGender){
  if(selectedGender == Gender.male){
    maleCardColor = container_color;
    if(feMaleCardColor == container_color){
      feMaleCardColor = inActiveColor;
    }
  }
  else{
    feMaleCardColor = container_color;
    if(maleCardColor == container_color){
      maleCardColor = inActiveColor;
    }
  }

}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF0A0E21),
        title: Center(
        child: Text("BMI CALCULATOR",style: kTitleText,
        ),
      ),),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child:ReusableCard(
                  onPress: (){
                    setState(() {
                      upDateColor(Gender.male);
                    });

                  },
                  colour: maleCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                )
                ),

                Expanded(child:ReusableCard(
                  onPress: (){
                    setState(() {
                      upDateColor(Gender.Female);
                    });

                  },
                  colour: feMaleCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  )
                )
                )
              ],
            ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                colour: container_color,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text("HEIGHT",style: kTextstyle,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(kHeight.toString(),style: kNumberStyle,),
                        Text("cm",style: kTextstyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                        thumbColor: Color(0xFFEB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x15EB1555),
                      ),
                      child: Slider(
                        value: kHeight.roundToDouble(),

                        inactiveColor: Color(0xFF8D8E98),

                        min: 120,
                        max: 220,
                        onChanged: (double newValue){
                          setState(() {
                            kHeight = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
            ],
          ), ),
         
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(
                  colour: container_color,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",style: kTextstyle,),
                      Text(kWeight.toString(),style: kNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(icon: FontAwesomeIcons.plus, onPress: (){
                            setState(() {
                              kWeight++;
                            });
                          }),
                          SizedBox(width: 10,),
                          RoundIcon(icon: FontAwesomeIcons.minus, onPress: (){
                            setState(() {
                              kWeight--;
                            });
                          }),
                        ],
                      ),


                    ],
                  ),
                )),
                Expanded(child: ReusableCard(
                  colour: container_color,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",style: kTextstyle,),
                        Text(kAge.toString(),style: kNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(icon: FontAwesomeIcons.plus, onPress: (){
                              setState(() {
                                kAge++;
                              });
                            }),
                            SizedBox(width: 10,),

                            RoundIcon(icon: FontAwesomeIcons.minus, onPress: (){
                              setState(() {
                                kAge--;
                              });
                            }),
                          ],
                        ),


                      ],
                    ),
                )
                )
              ],
            ),
          ),
          BottomButton(label: "CALCULATE", onPress:
                (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));
            },
          ),

        ],
      ),
    );
  }


}
class RoundIcon extends StatelessWidget {

  RoundIcon({required this.icon, required this.onPress});
  final IconData icon;
 void Function() onPress;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}










