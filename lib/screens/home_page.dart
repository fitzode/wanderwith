import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wanderwith/model/mountains.dart';
import 'package:wanderwith/utils/colors.dart';
import 'package:wanderwith/utils/home_page_bg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(
            double.infinity,
            MediaQuery.of(context)
                .size
                .height), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: HomePagePainter(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                blackColor.withOpacity(.4),
                blackColor.withOpacity(.22),
                blackColor.withOpacity(.11),
                whiteColor.withOpacity(.1),
              ],
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      header(),
                      const SizedBox(
                        height: 25,
                      ),
                      greeting(),
                      chips(),
                      const SizedBox(
                        height: 10,
                      ),
                      bestClimbs(),
                      const SizedBox(
                        height: 15,
                      ),
                      mostPopular(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/menu.png',
            height: 35,
            width: 35,
            fit: BoxFit.fill,
          ),
          const Icon(
            Icons.search,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget greeting() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Row(
            children: const [
              Text(
                'the ',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                'Nature',
                style: TextStyle(
                    fontSize: 35,
                    color: tealColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget chips() {
    List<String> chipsName = [
      'Most Popular',
      'Recommended',
      'Caves',
      'Beaches',
      'Most Attractive',
      'Top 10'
    ];
    return SizedBox(
      height: 65,
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: chipsName.length,
        itemBuilder: (BuildContext context, int index) {
          return FilterChip(
            backgroundColor: sageColor.withOpacity(0.7),
            label: Text(
              chipsName[index],
              style: const TextStyle(color: whiteColor, fontSize: 18),
            ),
            onSelected: (s) {},
          );
        },
        separatorBuilder: (c, i) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  Widget bestClimbs() {
    List<Mountains> _mountainsList = [
      Mountains(
        name: 'Mount Pulag',
        location: 'Benguet',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '9,606 ft',
        difficulty: 'Expert',
        img: 'mount_pulag.jpg',
        photos: [
          'mount_batulao.jpg',
          'mount_pulag.jpg',
          'mount_daraitan.jpg',
          'mount_tapulao.jpg',
          'mount_makiling.jpg'
        ],
      ),
      Mountains(
        name: 'Mount Daraitan',
        location: 'Tanay, Rizal',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '2,424 ft',
        difficulty: 'Intermediate',
        img: 'mount_daraitan.jpg',
        photos: [
          'mount_batulao.jpg',
          'mount_pulag.jpg',
          'mount_daraitan.jpg',
          'mount_tapulao.jpg',
          'mount_makiling.jpg'
        ],
      ),
      Mountains(
        name: 'Mount Batulao',
        location: 'Nasugbu, Batangas',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '2,660 ft',
        difficulty: 'Intermediate',
        img: 'mount_batulao.jpg',
        photos: [
          'mount_batulao.jpg',
          'mount_pulag.jpg',
          'mount_daraitan.jpg',
          'mount_tapulao.jpg',
          'mount_makiling.jpg'
        ],
      ),
      Mountains(
        name: 'Mount Tapulao',
        location: 'Zambales',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '6,683 ft',
        difficulty: 'Intermediate',
        img: 'mount_tapulao.jpg',
        photos: [
          'mount_batulao.jpg',
          'mount_pulag.jpg',
          'mount_daraitan.jpg',
          'mount_tapulao.jpg',
          'mount_makiling.jpg'
        ],
      ),
      Mountains(
        name: 'Mount Makiling',
        location: 'Laguna',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '3,576 ft',
        difficulty: 'Intermediate',
        img: 'mount_makiling.jpg',
        photos: [
          'mount_batulao.jpg',
          'mount_pulag.jpg',
          'mount_daraitan.jpg',
          'mount_tapulao.jpg',
          'mount_makiling.jpg'
        ],
      ),
    ];
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Best climbs for you',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadiusDirectional.circular(15)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadiusDirectional.circular(15)),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.more_horiz),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: tealColor.withOpacity(0.25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    top: 25,
                    bottom: 25,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _mountainsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'single_page',
                                  arguments: _mountainsList[index]);
                            },
                            child: Stack(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/${_mountainsList[index].img}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  left: 6,
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10.0, sigmaY: 10.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 8.0, sigmaY: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200
                                                  .withOpacity(0.6)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _mountainsList[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_pin,
                                                      size: 16,
                                                      color: sageColor,
                                                    ),
                                                    Text(
                                                      _mountainsList[index]
                                                          .location,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: blackColor
                                                            .withOpacity(0.90),
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
                                                      _mountainsList[index]
                                                          .elevation,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: blackColor
                                                            .withOpacity(0.90),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Row(
                                                //   children: [],
                                                // ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children:
                                                      _mountainsList[index]
                                                          .types
                                                          .map((e) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            height: 5,
                                                            width: 5,
                                                            child: CircleAvatar(
                                                                backgroundColor:
                                                                    blackColor),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(e,
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 25,
                                    color: Colors.red.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(
                            width: 10,
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mostPopular() {
    List<Mountains> _mountainsList = [
      Mountains(
        name: 'Mount Daraitan',
        location: 'Tanay, Rizal',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '2,424 ft',
        difficulty: 'Intermediate',
        img: 'mount_daraitan.jpg',
        photos: [''],
      ),
      Mountains(
        name: 'Mount Makiling',
        location: 'Laguna',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '3,576 ft',
        difficulty: 'Intermediate',
        img: 'mount_makiling.jpg',
        photos: [''],
      ),
      Mountains(
        name: 'Mount Tapulao',
        location: 'Zambales',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '6,683 ft',
        difficulty: 'Intermediate',
        img: 'mount_tapulao.jpg',
        photos: [''],
      ),
      Mountains(
        name: 'Mount Batulao',
        location: 'Nasugbu, Batangas',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '2,660 ft',
        difficulty: 'Intermediate',
        img: 'mount_batulao.jpg',
        photos: [''],
      ),
      Mountains(
        name: 'Mount Pulag',
        location: 'Benguet',
        types: ['Traditional', 'Sport'],
        rating: 4.5,
        elevation: '9,606 ft',
        difficulty: 'Expert',
        img: 'mount_pulag.jpg',
        photos: [''],
      ),
    ];
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Most Popular',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadiusDirectional.circular(15)),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadiusDirectional.circular(15)),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.more_horiz),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: tealColor.withOpacity(0.25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    top: 25,
                    bottom: 25,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _mountainsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/${_mountainsList[index].img}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 6,
                                left: 6,
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 8.0, sigmaY: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200
                                                .withOpacity(0.6)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _mountainsList[index].name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                                    _mountainsList[index]
                                                        .location,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: blackColor
                                                          .withOpacity(0.90),
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
                                                    _mountainsList[index]
                                                        .elevation,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: blackColor
                                                          .withOpacity(0.90),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Row(
                                              //   children: [],
                                              // ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: _mountainsList[index]
                                                    .types
                                                    .map((e) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                          width: 5,
                                                          child: CircleAvatar(
                                                              backgroundColor:
                                                                  blackColor),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(e,
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: 25,
                                  color: Colors.red.withOpacity(0.9),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(
                            width: 10,
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
