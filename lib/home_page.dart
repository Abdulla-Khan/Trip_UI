// ignore_for_file: deprecated_member_use

import 'package:day2_trip/detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'data.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Trip> trip = Trip.list;
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SafeArea(child: Expanded(child: customDrawer())),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInExpo,
            builder: (_, double val, __) {
              return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 5) * value),
                  child: Scaffold(
                    appBar: AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        leading: IconButton(
                            onPressed: () {
                              setState(() {
                                value == 0 ? value = 1 : value = 0;
                              });
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ))),
                    backgroundColor: Color.fromRGBO(244, 243, 243, 1),
                    body: SafeArea(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Find Your",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Next Trip',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 243, 243, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black87,
                                    ),
                                    hintText: "Search you're loooking for",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Promo Today",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: trip.length,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (BuildContext context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            DetailPage(
                                                                trip[index])));
                                          },
                                          child: promoCard(trip[index].image));
                                    }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/four.jpg',
                                      )),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          stops: [
                                            0.3,
                                            0.9
                                          ],
                                          colors: [
                                            Colors.black.withOpacity(.8),
                                            Colors.black.withOpacity(.2)
                                          ])),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Best Place",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  )));
            }),
      ]),
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
