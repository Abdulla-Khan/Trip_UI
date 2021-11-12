import 'dart:math';

import 'package:flutter/material.dart';

import 'data.dart';
import 'drawer.dart';
import 'profile_clipper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Trip> trip = Trip.list;

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  PageController _yourFavorPageController;
  PageController _yourPostsPageController;
  double value = 0;

  @override
  void initState() {
    super.initState();
    _yourFavorPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);

    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: Expanded(child: customDrawer())),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              builder: (_, double val, __) {
                return (Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * value),
                    child: Scaffold(
                      body: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipPath(
                                  clipper: ProfileClipper(),
                                  child: Image(
                                    height: 300,
                                    width: double.infinity,
                                    image: AssetImage(
                                        'assets/images/user_background.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black45,
                                          offset: Offset(0, 2),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: ClipOval(
                                      child: Image(
                                        height: 120,
                                        width: 120,
                                        image: AssetImage(
                                          'assets/images/user.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 20,
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          value == 0 ? value = 1 : value = 0;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Abdullah ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.only(right: 250),
                                child: Text(
                                  "My Trips",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: trip.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 5),
                                      child: promoCard(trip[index].image),
                                    );
                                  }),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 110.0),
                                child: Text(
                                  "All Rights Reserved \u00a9",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )));
              }),
        ],
      ),
    );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2)
              ])),
        ),
      ),
    );
  }
}
