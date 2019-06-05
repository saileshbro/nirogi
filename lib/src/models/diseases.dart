import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Disease {
  final String name;
  final String imageUrl;
  final String body;
  Disease({@required this.name, this.imageUrl, this.body});
}

List<Disease> allDiseases = [
  Disease(
      name: "Acid Reflux Disease",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Acute Kidney Failure",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Allergy",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Alzheimer’s Disease",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Amoebiasis/Giardiasis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Anemia",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Appendicitis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Arthritis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Ascariasis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Asthma",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Atrial Fibrillation (AF)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Autism Spectrum Disorder (ASD)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Blood Cancer (Leukemia)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Breast Cancer",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Cancer",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Cataract",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Chronic Obstructive Pulmonary Disease (COPD)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Cirrhosis of Liver",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Conjunctivitis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Depression",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Diabetes Mellitus",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Diarrhea",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Difficulty swallowing (Dysphagia)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Diphtheria",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Esophageal Varices",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Gasteroesophageal Reflux Disease",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Gum Disease",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Heart Attack",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Heart Failure",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Hepatitis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "High Cholesterol",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "HIV/AIDS",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Hookworm Infestation",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Hypertension",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Hyperuricemia",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Hypotension",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Jaundice",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Lung Cancer",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Malaria",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Peptic Ulcer Disease",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Pneumonia",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Protein Energy Malnutrition",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Rabies",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Rheumatic Fever",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Ringworm",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Scabies",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Schizophrenia",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Sexually Transmitted Diseases",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Shingles / Herpes Zoster",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Sinusitis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Stroke",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Stye and Chalazion",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Syphilis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Systemic Lupus Erythematosus (Lupus)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Tetanus",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Thyroid Disorder",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Tingling or Numbness",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Tuberculosis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Upper Respiratory Infection (URI)",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Viral Exanthems",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  Disease(
      name: "Vitamin Deficiency",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png",
      body:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
];

final List<Disease> topDisease = <Disease>[
  Disease(
      name: "Giardiasis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Amoebiasis-and-Giardiasis-1-150x150.png"),
  Disease(
      name: "Schizophrenia",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2017/12/1.-Schizophrenia-150x150.jpg"),
  Disease(
      name: "Ascariasis",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Ascaris-life-cycle-150x150.jpg"),
  Disease(
      name: "Deficiency",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Vitamin-Deficiency-150x150.png"),
  Disease(
      name: "Asthma",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Asthma-150x150.png"),
  Disease(
      name: "Cataract",
      imageUrl:
          "http://niroginepal.com/wp-content/uploads/2016/04/Asthma-150x150.png")
];
