import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wanderwith/utils/colors.dart';
import 'package:wanderwith/utils/fade_animation.dart';
import 'dart:math' as math;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();

    return Scaffold(
      body: CarouselSlider(
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayCurve: Curves.easeInToLinear,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          pageSnapping: false,
          autoPlay: false,
          viewportFraction: 1,
          height: MediaQuery.of(context).size.height,
        ),
        items: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/landing_bg.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    blackColor.withOpacity(.7),
                    blackColor.withOpacity(.6),
                    blackColor.withOpacity(.2),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                  top: 100.0,
                  bottom: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const FadeAnimation(
                          1.4,
                          Text(
                            'Welcome wanderers!',
                            style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                            textAlign: TextAlign.center,
                          ),
                          Offset(0, 1),
                        ),
                        const SizedBox(height: 10),
                        FadeAnimation(
                          1.6,
                          Text(
                            "We will help you find the best mountains for your adventures.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: whiteColor.withOpacity(0.55),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const Offset(0, 1),
                        ),
                      ],
                    ),
                    FadeAnimation(
                      1.8,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            buttonCarouselController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInToLinear);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: whiteColor.withOpacity(0.75),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 6,
                                  spreadRadius: 0.8,
                                  color: tealColor,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/btn_land.png',
                                height: 25,
                                width: 25,
                                fit: BoxFit.contain,
                                color: sageColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Offset(0, 1),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/landing_bg_2.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    blackColor.withOpacity(.7),
                    blackColor.withOpacity(.6),
                    blackColor.withOpacity(.2),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FadeAnimation(
                      1.4,
                      Text(
                        'Discover the best mountains in the Philippines!',
                        style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: whiteColor),
                        textAlign: TextAlign.start,
                      ),
                      Offset(0, 1),
                    ),
                    const SizedBox(height: 10),
                    FadeAnimation(
                      1.6,
                      Text(
                        "You must see the beautiful mountains in the Philippines.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor.withOpacity(0.55),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const Offset(0, 1),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                      1.8,
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              buttonCarouselController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInToLinear);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: whiteColor.withOpacity(0.75),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 6,
                                    spreadRadius: 0.8,
                                    color: tealColor,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Transform.rotate(
                                  angle: math.pi / .2,
                                  child: Image.asset(
                                    'assets/images/btn_land.png',
                                    height: 25,
                                    width: 25,
                                    fit: BoxFit.contain,
                                    color: sageColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              buttonCarouselController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInToLinear);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: whiteColor.withOpacity(0.75),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 6,
                                    spreadRadius: 0.8,
                                    color: tealColor,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/images/btn_land.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.contain,
                                  color: sageColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Offset(0, 1),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/landing_bg_3.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    blackColor.withOpacity(.7),
                    blackColor.withOpacity(.6),
                    blackColor.withOpacity(.2),
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 35, right: 35, bottom: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const FadeAnimation(
                      1.4,
                      Text(
                        'Adventures with someone!',
                        style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: whiteColor),
                        textAlign: TextAlign.start,
                      ),
                      Offset(0, 1),
                    ),
                    const SizedBox(height: 10),
                    FadeAnimation(
                      1.6,
                      Text(
                        "You can go adventure with your friends, family or loved ones.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor.withOpacity(0.55),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const Offset(0, 1),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeAnimation(
                      1.8,
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              buttonCarouselController.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInToLinear);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: whiteColor.withOpacity(0.75),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 6,
                                    spreadRadius: 0.8,
                                    color: tealColor,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Transform.rotate(
                                  angle: math.pi / .2,
                                  child: Image.asset(
                                    'assets/images/btn_land.png',
                                    height: 25,
                                    width: 25,
                                    fit: BoxFit.contain,
                                    color: sageColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'home_page', (route) => false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: whiteColor.withOpacity(0.75),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 6,
                                    spreadRadius: 0.8,
                                    color: tealColor,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/images/btn_land.png',
                                  height: 25,
                                  width: 25,
                                  fit: BoxFit.contain,
                                  color: sageColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Offset(0, 1),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
