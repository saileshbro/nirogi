import 'package:meta/meta.dart';

class Symptom {
  final String title;
  final String imageUrl;
  final String body;
  Symptom({@required this.title, this.imageUrl, this.body});
  String get name => title;
}

List<Symptom> allSymptoms = [
  Symptom(
      title: "Abdominal Pain",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Back Pain",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Black stools",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Blurry Vision",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Breast Lump",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Change in Urine Color",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Chest Pain or Tightness",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Constipation",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Cough",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Coughing up Blood",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Dizziness",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Excess Urination",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Fatigue / Tiredness",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Fever",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Headache",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Itching",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Menstrual Irregularities",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Nausea and Vomiting",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Neck Swelling",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Palpitation",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Pins and Needles",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Red Eye",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Shortness of breath (Dyspnea)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Skin Rash",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Sore Throat",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Vomiting of blood (Hematemesis)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Weight Gain – Obesity",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Symptom(
      title: "Weight Loss",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
];
final List<Symptom> topSymptoms = [
  Symptom(
    title: "Weight Loss",
    imageUrl:
        "http://niroginepal.com/wp-content/uploads/2016/01/Weight-loss-150x150.png",
  ),
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
