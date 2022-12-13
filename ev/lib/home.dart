import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home_bg.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Sonia!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Locate Your Nearest",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            "Charging Station",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 180,
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/avatar.jpg"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0x8AFFFFFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      suffixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Trending",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 300,
                          autoPlay: true,
                          //enlargeCenterPage: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                        items: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                  image: AssetImage('assets/trending.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          /*Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.cyan[800],
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                  image: AssetImage('assets/trending.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),*/
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Nearest Stations",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 170,
                          autoPlay: false,
                          //enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.8,
                        ),
                        items: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 110,
                                    child: Image.asset("assets/station.jpg"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Charge Point",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "AB -1",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Text(
                                        "Street 5, Malviya Nagar",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                              const EdgeInsets.fromLTRB(
                                                  50, 15, 50, 15),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.green),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                    color: Colors.green),
                                              ),
                                            )),
                                        child: const Text(
                                          'Book Slot',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          /*Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.cyan[800],
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                  image: AssetImage('assets/trending.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),*/
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
