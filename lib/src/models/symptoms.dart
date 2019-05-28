import 'package:meta/meta.dart';

class Symptom {
  final String title;
  final String imageUrl;
  Symptom({@required this.title, this.imageUrl});
  String get name => title;
}

final List<Symptom> topSymptoms = [
  Symptom(
      title: "Weight Loss",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png"),
  Symptom(
      title: "Headache",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Headache-150x150.png"),
  Symptom(
      title: "Back Pain",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Back-Pain-1-150x150.png"),
  Symptom(
      title: "Neck Swelling",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Neck-Swelling-150x150.png"),
  Symptom(
      title: "Chest Pain or Tightness",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Chast-Pain-150x150.png"),
  Symptom(
      title: "Fever",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Fever-150x150.png"),
  Symptom(
      title: "Black stools",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Black-Stool-150x150.png"),
];
