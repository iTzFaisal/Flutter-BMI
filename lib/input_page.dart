import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    color: maleCardColor,
                    child:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    color: femaleCardColor,
                    child: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(color: kActiveCardColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(color: kActiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(color: kActiveCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: kButtomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kButtomContainerHeight,
          )
        ],
      ),
    );
  }

  void updateColor(Gender gender) {
    // 1 for male , 2 for female
    if (gender == Gender.male) {
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == kInactiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kInactiveCardColor;
      }
    }
  }
}
