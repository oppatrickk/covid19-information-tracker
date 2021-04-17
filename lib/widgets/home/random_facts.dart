import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';
import 'dart:math';

// Pages
import 'package:covid19_information_center/pages/information_subpages/facts.dart';

class RandomFacts extends StatefulWidget {

  @override
  _RandomFactsState createState() => _RandomFactsState();
}

class _RandomFactsState extends State<RandomFacts> {


  final List<String> textList = [
    "       Micronutrients, such as vitamins D and C and zinc, are critical for a well-functioning immune system and play a vital role in promoting health and nutritional well-being.  There is currently no guidance on the use of micronutrient supplements as a treatment of COVID-19.",
    "       Most people who get COVID-19 have mild or moderate symptoms and can recover thanks to supportive care. If you have a cough, fever and difficulty breathing seek medical care early - call your health facility by telephone first. If you have fever and live in an area with malaria or dengue seek medical care immediately.",
    "       The harmful use of alcohol increases your risk of health problems.",
    "       Antibiotics work only against bacteria, not viruses. COVID-19 is caused by a virus, and therefore antibiotics should not be used for prevention or treatment. \n\n      However, if you are hospitalized for COVID-19, you may receive antibiotics because bacterial co-infection is possible.",
    "       The virus that causes COVID-19 is in a family of viruses called Coronaviridae. Antibiotics do not work against viruses. Some people who become ill with COVID-19 can also develop a bacterial infection as a complication. In this case, antibiotics may be recommended by a health care provider.",
  ];

  final List<String> titleList = [
    "Vitamin and mineral supplements cannot cure COVID-19 ",
    "Most people who get COVID-19 recover from it",
    "Drinking alcohol does not protect you against COVID-19 and can be dangerous",
    "Antibiotics CANNOT prevent or treat COVID-19",
    "The coronavirus disease (COVID-19) is caused by a virus, NOT by bacteria",
  ];

  var rng = Random();



  @override
  Widget build(BuildContext context) {
    var currentNum = rng.nextInt(5);

    return AnimatedContainer(
      duration: Duration (seconds: 3),
      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            titleList[currentNum],
            style: TextStyle(
              color: kBodyTextColor1,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              textList[currentNum],
              style: TextStyle(
                color: kBodyTextColor2,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                setState(() { currentNum = rng.nextInt(5); });
              },
              child: Text(
                "Read Another",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
