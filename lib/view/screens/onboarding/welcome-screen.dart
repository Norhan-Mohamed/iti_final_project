import 'package:flutter/material.dart';
import 'package:iti_final_project/view/screens/onboarding/onboarding-screen.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/onboarding.png")),
                  Padding(
                    padding: EdgeInsets.all(36.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '" ',
                            style: sansHeadTitle.copyWith(fontSize: 30),
                          ),
                          TextSpan(
                            text: 'Clothes',
                            style: sansHeadTitle.copyWith(
                              backgroundColor: Colors.yellow,
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: ' means nothing until someone ',
                            style: sansHeadTitle.copyWith(fontSize: 30),
                          ),
                          TextSpan(
                            text: 'lives',
                            style: sansHeadTitle.copyWith(
                              backgroundColor: Colors.yellow,
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: ' in them "',
                            style: sansHeadTitle.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: ColorResources.PrimaryColorGold,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_outlined, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
