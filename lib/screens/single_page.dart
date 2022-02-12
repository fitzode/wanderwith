import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wanderwith/model/mountains.dart';
import 'package:wanderwith/utils/colors.dart';

class SinglePage extends StatefulWidget {
  final Mountains mountains;
  const SinglePage({Key? key, required this.mountains}) : super(key: key);

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  double titleRight = -50;
  double titleBottom = -150;
  double headerPicTop = -120;
  double containerBodyBottom = -300;
  double googleMapTop = -300;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      showPage();
    });
  }

  showPage() {
    setState(() {
      titleRight = 5;
      titleBottom = 150;
      headerPicTop = 0;
      containerBodyBottom = 0;
      googleMapTop = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                blackColor.withOpacity(.3),
                blackColor.withOpacity(.3),
                blackColor.withOpacity(.3),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      top: googleMapTop,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/googlemap.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                blackColor.withOpacity(.3),
                                blackColor.withOpacity(.3),
                                blackColor.withOpacity(.3),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      top: headerPicTop,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'image_viewer',
                              arguments: widget.mountains.img);
                        },
                        child: Card(
                          margin:
                              const EdgeInsets.only(right: 10.0, bottom: 12.0),
                          color: tealColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0, bottom: 12.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/${widget.mountains.img}',
                                    height: MediaQuery.of(context).size.height *
                                        0.40,
                                    width: MediaQuery.of(context).size.width *
                                        0.46,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    left: 15,
                                    right: 15,
                                    bottom: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: blackColor.withOpacity(0.60),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: RatingBar.builder(
                                          initialRating:
                                              widget.mountains.rating,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemSize: 25,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      right: titleRight,
                      bottom: titleBottom,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.mountains.name,
                                style: const TextStyle(
                                    color: blackColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.location_pin,
                                    size: 16,
                                    color: sageColor,
                                  ),
                                  Text(
                                    widget.mountains.location,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: blackColor.withOpacity(0.90),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    'assets/images/height.png',
                                    height: 23,
                                    width: 23,
                                    color: sageColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.mountains.elevation,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: blackColor.withOpacity(0.90),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      bottom: containerBodyBottom,
                      duration: const Duration(milliseconds: 600),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: tealColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                                ),
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor.withOpacity(0.85)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Available tour guide',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      dense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                      title: Text(
                                        'John doe',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor.withOpacity(0.85),
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Age: 28',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor.withOpacity(0.85),
                                        ),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                    ListTile(
                                      dense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                      title: Text(
                                        'John mark',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor.withOpacity(0.85),
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Age: 31',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor.withOpacity(0.85),
                                        ),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                    ListTile(
                                      dense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                      title: Text(
                                        'Mark herras',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor.withOpacity(0.85),
                                        ),
                                      ),
                                      subtitle: Text(
                                        'Age: 38',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor.withOpacity(0.85),
                                        ),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios,color: whiteColor,),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  'Gallery',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.mountains.photos.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                              'assets/images/${widget.mountains.photos[index]}',
                                              fit: BoxFit.cover),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (c, i) {
                                      return const SizedBox(
                                        width: 10,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
