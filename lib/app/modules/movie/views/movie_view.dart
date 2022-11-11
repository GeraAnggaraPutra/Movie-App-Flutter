import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F111D),
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
      //   title: const Text('Movie'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Icon(
                    //     Icons.arrow_back,
                    //     color: Colors.white,
                    //     size: 30,
                    //   ),
                    // ),
                    SizedBox(height: 30),
                    Text(
                      "Movies",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    for (int i = 1; i < 7;i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/images/$i.jpg",
                                height: 70,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Text(
                                "Genre",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 23,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
