import 'package:flutter/material.dart';
import 'package:covid19_information_center/constant.dart';

// Pages
import 'package:covid19_information_center/pages/information_subpages/symptoms.dart';
import 'package:covid19_information_center/pages/information_subpages/preventions.dart';

// Widgets
import 'package:covid19_information_center/widgets/information/information_card.dart';
import 'package:covid19_information_center/widgets/information/common_symptoms.dart';
import 'package:covid19_information_center/widgets/information/prevention.dart';
import 'package:covid19_information_center/widgets/home/random_facts.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: (Colors.transparent),
            ),
            Positioned(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30.0, bottom: 50.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Common Symptoms",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: kBodyTextColor1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonSymptoms(
                                title: "Fever",
                                image: "assets/images/fever.png",
                              ),
                              CommonSymptoms(
                                title: "Cough",
                                image: "assets/images/cough.png",
                              ),
                              CommonSymptoms(
                                title: "Fatigue",
                                image: "assets/images/fatigue.png",
                              ),
                            ],
                          ),
                        ),
                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Symptoms()));
                              },
                              child: Text(
                                "Read More",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),

                         */
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              Text(
                                "Prevention",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: kBodyTextColor1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Prevention(
                                title: "Social Distance",
                                image: "assets/images/distance.png",
                              ),
                              Prevention(
                                title: "Wear Mask",
                                image: "assets/images/mask.png",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Prevention(
                                title: "Wash Hands",
                                image: "assets/images/wash.png",

                              ),
                              Prevention(
                                title: "Stay at Home",
                                image: "assets/images/home.png",
                              ),
                            ],
                          ),
                        ),
                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Preventions()));
                              },
                              child: Text(
                                "Read More",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),

                         */
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                          child: Row(
                            children: [
                              Text(
                                "Facts",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: kBodyTextColor1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RandomFacts(),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 5.0),
                          child: Row(
                            children: [
                              Text(
                                "More Information",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: kBodyTextColor1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InformationCard(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
