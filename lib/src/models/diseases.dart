import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Disease {
  final String name;
  final String imageUrl;
  Disease({@required this.name, this.imageUrl});
}

List<Disease> allDiseases = [
  Disease(name: "Acid Reflux Disease"),
  Disease(name: "Acute Kidney Failure"),
  Disease(name: "Allergy"),
  Disease(name: "Alzheimer’s Disease"),
  Disease(name: "Amoebiasis/Giardiasis"),
  Disease(name: "Anemia"),
  Disease(name: "Appendicitis"),
  Disease(name: "Arthritis"),
  Disease(name: "Ascariasis"),
  Disease(name: "Asthma"),
  Disease(name: "Atrial Fibrillation (AF)"),
  Disease(name: "Autism Spectrum Disorder (ASD)"),
  Disease(name: "Blood Cancer (Leukemia)"),
  Disease(name: "Breast Cancer"),
  Disease(name: "Cancer"),
  Disease(name: "Cataract"),
  Disease(name: "Chronic Obstructive Pulmonary Disease (COPD)"),
  Disease(name: "Cirrhosis of Liver"),
  Disease(name: "Conjunctivitis"),
  Disease(name: "Depression"),
  Disease(name: "Diabetes Mellitus"),
  Disease(name: "Diarrhea"),
  Disease(name: "Difficulty swallowing (Dysphagia)"),
  Disease(name: "Diphtheria"),
  Disease(name: "Esophageal Varices"),
  Disease(name: "Gasteroesophageal Reflux Disease"),
  Disease(name: "Gum Disease"),
  Disease(name: "Heart Attack"),
  Disease(name: "Heart Failure"),
  Disease(name: "Hepatitis"),
  Disease(name: "High Cholesterol"),
  Disease(name: "HIV/AIDS"),
  Disease(name: "Hookworm Infestation"),
  Disease(name: "Hypertension"),
  Disease(name: "Hyperuricemia"),
  Disease(name: "Hypotension"),
  Disease(name: "Jaundice"),
  Disease(name: "Lung Cancer"),
  Disease(name: "Malaria"),
  Disease(name: "Peptic Ulcer Disease"),
  Disease(name: "Pneumonia"),
  Disease(name: "Protein Energy Malnutrition"),
  Disease(name: "Rabies"),
  Disease(name: "Rheumatic Fever"),
  Disease(name: "Ringworm"),
  Disease(name: "Scabies"),
  Disease(name: "Schizophrenia"),
  Disease(name: "Sexually Transmitted Diseases"),
  Disease(name: "Shingles / Herpes Zoster"),
  Disease(name: "Sinusitis"),
  Disease(name: "Stroke"),
  Disease(name: "Stye and Chalazion"),
  Disease(name: "Syphilis"),
  Disease(name: "Systemic Lupus Erythematosus (Lupus)"),
  Disease(name: "Tetanus"),
  Disease(name: "Thyroid Disorder"),
  Disease(name: "Tingling or Numbness"),
  Disease(name: "Tuberculosis"),
  Disease(name: "Upper Respiratory Infection (URI)"),
  Disease(name: "Viral Exanthems"),
  Disease(name: "Vitamin Deficiency")
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
