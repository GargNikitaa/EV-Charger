import 'package:flutter/cupertino.dart';

class UnbordingContent {
  String image;
  String title;
  String description;
  Color bg;

  UnbordingContent(
      {required this.image,
      required this.title,
      required this.description,
      required this.bg});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      image: 'assets/screen1.png',
      bg: Color.fromARGB(255, 131, 248, 135),
      description: 'Recieve our assistance and emergency services',
      title: "With our quickest services, "
          "we've got you covered. "),
  UnbordingContent(
      image: 'assets/screen2.png',
      bg: Color.fromARGB(255, 248, 251, 101),
      description: 'Now locating a charging station would be just a click away',
      title: "Locate the nearest charging  "
          "station "),
  UnbordingContent(
    image: 'assets/screen3.png',
    bg: Color.fromARGB(255, 156, 230, 233),
    title: "Book a hassle-free charging slot",
    description: 'Booking a slot as per your preferred time is made '
        "simple",
  ),
];
