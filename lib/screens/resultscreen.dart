import 'package:flutter/material.dart';

import '../components/reuseablecard.dart';

class ResultScreen extends StatefulWidget {
  final String bmi;
  final String result;
  final String feedback;
  const ResultScreen({super.key, required this.bmi, required this.result, required this.feedback});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text("Result", style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold
              ),),
            ),
          ),
          ReuseableCard(color: Color(0xff1d1e33),
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(widget.result, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.green
                  ),),
                ),
                Text(widget.bmi, style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                Text(widget.feedback)
              ],
            ),
            onpress: () {},
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("RE-CALCULATE"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            minimumSize: Size(double.infinity, 50)
          ),
          ),

        ],
      ),
    );
  }
}
