import 'package:bmi_calculator/calculation/functions.dart';
import 'package:bmi_calculator/screens/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reuseablecard.dart';
import '../components/roundedbuton.dart';

enum genderSection { Male, Female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inActiveColor = Color(0xff1d1e33);
  final activeColor = Color(0xffeb1555);
  genderSection? selection;
  int _height = 150;
  int _weight = 65;
  int _age = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: selection == genderSection.Male ? activeColor : inActiveColor,
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                          ),
                        ),
                        Container(
                          child: Text("MALE"),
                        )
                      ],
                    ),
                    onpress: () {
                      setState(() {
                        selection = genderSection.Male;
                      });
                    },
                  ),
                  ReuseableCard(
                    color: selection == genderSection.Male ? inActiveColor : activeColor,
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                          ),
                        ),
                        Container(
                          child: Text("FEMALE"),
                        )
                      ],
                    ),
                    onpress: () {
                      setState(() {
                        selection = genderSection.Female;
                      });
                    },
                  ),
                ],
              ),
            ),
            ReuseableCard(
              color: Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "HEIGHT",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        child: Text(
                          _height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Cm",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 2,
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x15eb1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        max: 220,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue.toInt().round();
                          });
                        },
                        value: _height.toDouble(),
                      ),
                    ),
                  )
                ],
              ),
              onpress: () {},
            ),
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("WEIGHT"),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Text(
                                _weight.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Kg",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                              color: Color(0xff0A0E21),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            roundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                              color: Color(0xff0A0E21),
                            ),
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  ),
                  ReuseableCard(
                    color: Color(0xff1d1e33),
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("AGE"),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              child: Text(
                                _age.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "yr",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundedButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  _age++;
                                });
                              },
                              color: Color(0xff0A0E21),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            roundedButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  _age--;
                                });
                              },
                              color: Color(0xff0A0E21),
                            ),
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                CalculateBMI calcBMI = CalculateBMI(
                  height: _height,
                  weight: _weight,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(
                  bmi: calcBMI.calcBMI(),
                  result: calcBMI.getResult(),
                  feedback: calcBMI.feedBack(),
                )));
              },
              child: Text("CALCULATE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffeb1555),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
