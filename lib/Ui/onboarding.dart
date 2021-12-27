import 'package:flutter/material.dart';
import 'package:flutter_prototype/Ui/home.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
          child: IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'Welcome to Report App',
              body:
                  'A easy and quick solution to report infrastructure breakdown.',
              image: buildImage('assets/images/introduction0.jpg')),
          PageViewModel(
              title: 'Point Location',
              body: 'Find the breakdown location by using Map.',
              image: buildImage('assets/images/introduction1.jpg')),
          PageViewModel(
              title: 'Upload Image',
              body: 'Take a photo of the breakdown and upload it.',
              image: buildImage('assets/images/introduction2.jpg')),
          PageViewModel(
              title: 'Describes Breakdown',
              body: 'Write a short title and brief descriptions of the breakdown.',
              image: buildImage('assets/images/introduction3.jpg')),
          PageViewModel(
              title: 'Wait For Feedback',
              body: 'Feedback will be given after 1-3 days of working days.',
              image: buildImage('assets/images/introduction4.jpg')),
        ],
        onDone: () {
          goToHome(context);
        },
        onSkip: () {
          goToHome(context);
        },
        showSkipButton: true,
        skip: const Text('Skip'),
        next: const Text('Next'),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ));

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  void goToHome(context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
}
