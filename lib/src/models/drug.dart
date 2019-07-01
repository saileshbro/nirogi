class Drugs {
  List<Drug> drugs;

  Drugs({this.drugs});

  Drugs.fromJson(Map<String, dynamic> json) {
    if (json['drugs'] != null) {
      drugs = new List<Drug>();
      json['drugs'].forEach((v) {
        drugs.add(new Drug.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drugs != null) {
      data['drugs'] = this.drugs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drug {
  String brandName;
  String genericName;
  String imageUrl;
  String dose;
  String summary;
  List<Section> sections;

  Drug(
      {this.brandName,
      this.genericName,
      this.imageUrl,
      this.dose,
      this.summary,
      this.sections});

  Drug.fromJson(Map<String, dynamic> json) {
    brandName = json['brandName'];
    genericName = json['genericName'];
    imageUrl = json['imageUrl'];
    dose = json['dose'];
    summary = json['summary'];
    if (json['sections'] != null) {
      sections = new List<Section>();
      json['sections'].forEach((v) {
        sections.add(new Section.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandName'] = this.brandName;
    data['genericName'] = this.genericName;
    data['imageUrl'] = this.imageUrl;
    data['dose'] = this.dose;
    data['summary'] = this.summary;
    if (this.sections != null) {
      data['sections'] = this.sections.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Section {
  String title;
  String content;

  Section({this.title, this.content});

  Section.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}

final Drug drug = new Drug(
    brandName: "HydroDIURIL",
    genericName: "hydrochlorothiazide",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_6801.jpg",
    dose: "500mg",
    summary:
        "It increases the amount of urine passed, which causes the body to lose salt and water",
    sections: [
      Section(
        title: "What is this medicine?",
        content:
            "HYDROCHLOROTHIAZIDE (hye droe klor oh THYE a zide) is a diuretic. It increases the amount of urine passed, which causes the body to lose salt and water. This medicine is used to treat high blood pressure. It is also reduces the swelling and water retention caused by various medical conditions, such as heart, liver, or kidney disease.<p></p>",
      ),
      Section(
        title:
            "What should I tell my health care provider before I take this medicine?",
        content:
            "They need to know if you have any of these conditions:<ul><li>diabetes</li><li>gout</li><li>immune system problems, like lupus</li><li>kidney disease or kidney stones</li><li>liver disease</li><li>pancreatitis</li><li>small amount of urine or difficulty passing urine</li><li>an unusual or allergic reaction to hydrochlorothiazide, sulfa drugs, other medicines, foods, dyes, or preservatives</li><li>pregnant or trying to get pregnant</li><li>breast- feeding</li></ul><p></p><p></p>",
      ),
      Section(
        title: "How should I use this medicine?",
        content:
            "Take this medicine by mouth with a glass of water. Follow the directions on the prescription label. Take your medicine at regular intervals. Remember that you will need to pass urine frequently after taking this medicine. Do not take your doses at a time of day that will cause you problems. Do not stop taking your medicine unless your doctor tells you to.<br /><br />Talk to your pediatrician regarding the use of this medicine in children. Special care may be needed.<p></p>",
      ),
      Section(
        title: "What if I miss a dose?",
        content:
            "If you miss a dose, take it as soon as you can. If it is almost time for your next dose, take only that dose. Do not take double or extra doses.<p></p>",
      ),
      Section(
        title: "What may interact with this medicine?",
        content:
            "<ul><li>cholestyramine</li><li>colestipol</li><li>digoxin</li><li>dofetilide</li><li>lithium</li><li>medicines for blood pressure</li><li>medicines for diabetes</li><li>medicines that relax muscles for surgery</li><li>other diuretics</li><li>steroid medicines like prednisone or cortisone</li></ul><p></p><p></p>",
      ),
      Section(
        title: "What should I watch for while using this medicine?",
        content:
            "Visit your doctor or health care professional for regular checks on your progress. Check your blood pressure as directed. Ask your doctor or health care professional what your blood pressure should be and when you should contact him or her.<br /><br />You may need to be on a special diet while taking this medicine. Ask your doctor.<br /><br />Check with your doctor or health care professional if you get an attack of severe diarrhea, nausea and vomiting, or if you sweat a lot. The loss of too much body fluid can make it dangerous for you to take this medicine.<br /><br />You may get drowsy or dizzy. Do not drive, use machinery, or do anything that needs mental alertness until you know how this medicine affects you. Do not stand or sit up quickly, especially if you are an older patient. This reduces the risk of dizzy or fainting spells. Alcohol may interfere with the effect of this medicine. Avoid alcoholic drinks.<br /><br />This medicine may affect your blood sugar level. If you have diabetes, check with your doctor or health care professional before changing the dose of your diabetic medicine.<br /><br />This medicine can make you more sensitive to the sun. Keep out of the sun. If you cannot avoid being in the sun, wear protective clothing and use sunscreen. Do not use sun lamps or tanning beds/ booths.<p></p>  <a name=\"page2\"></a>",
      ),
      Section(
        title: "What side effects may I notice from receiving this medicine?",
        content:
            "Side effects that you should report to your doctor or health care professional as soon as possible:<ul><li>allergic reactions such as skin rash or itching, hives, swelling of the lips, mouth, tongue, or throat</li><li>changes in vision</li><li>chest pain</li><li>eye pain</li><li>fast or irregular heartbeat</li><li>feeling faint or lightheaded, falls</li><li>gout attack</li><li>muscle pain or cramps</li><li>pain or difficulty when passing urine</li><li>pain, tingling, numbness in the hands or feet</li><li>redness, blistering, peeling or loosening of the skin, including inside the mouth</li><li>unusually weak or tired</li></ul><p>Side effects that usually do not require medical attention (report to your doctor or health care professional if they continue or are bothersome):</p><ul><li>change in sex drive or performance</li><li>dry mouth</li><li>headache</li><li>stomach upset</li></ul><p></p><p></p>",
      ),
      Section(
          title: "Where should I keep my medicine?",
          content:
              "Keep out of the reach of children.<br /><br />Store at room temperature between 15 and 30 degrees C (59 and 86 degrees F). Do not freeze. Protect from light and moisture. Keep container closed tightly. Throw away any unused medicine after the expiration date.<p></p><p>Remember, keep this and all other medicines out of the reach of children, never share your medicines with others, and use this medication only for the indication prescribed.</p>")
    ]);
final Drugs commonDrugs = Drugs(
    drugs: [
  Drug(
    brandName: "Cleocin",
    genericName: "clindamycin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_5289.jpg",
    summary: "It is used to treat certain kinds of bacterial infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "Rifadin",
    genericName: "rifampin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_7123.jpg",
    summary:
        "It is used to treat or prevent certain kinds of bacterial infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "HydroDIURIL",
    genericName: "hydrochlorothiazide",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_6801.jpg",
    summary:
        "It increases the amount of urine passed, which causes the body to lose salt and water",
    dose: "500mg",
  ),
  Drug(
    brandName: "Ampicillin",
    genericName: "ampicillin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_4013.jpg",
    summary: "It is used to treat certain kinds of bacterial infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "Azithromycin",
    genericName: "azithromycin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_8643.jpg",
    summary:
        "It is used to treat or prevent certain kinds of bacterial infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "Melfiat 105 Unicelles",
    genericName: "phendimetrazine",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_1440.jpg",
    summary:
        "It is used with a reduced calorie diet and exercise to help you lose weight",
    dose: "500mg",
  ),
  Drug(
    brandName: "Nortriptyline",
    genericName: "nortriptyline",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_2337.jpg",
    summary: "It is used to treat depression.",
    dose: "500mg",
  ),
  Drug(
    brandName: "Metoprolol Succ ER",
    dose: "500mg",
    genericName: "metoprolol",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_14629.jpg",
    summary:
        "Beta-blockers reduce the workload on the heart and help it to beat more regularly",
  ),
  Drug(
    brandName: "Zantac",
    genericName: "ranitidine",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_10156.jpg",
    summary: "It is used to treat stomach or intestinal ulcers",
    dose: "500mg",
  ),
  Drug(
    brandName: "Dicloxacillin",
    genericName: "dicloxacillin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_2417.jpg",
    summary: "It is used to treat certain kinds of bacterial infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "Atenolol",
    genericName: "atenolol",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_14326.jpg",
    summary:
        "Beta-blockers reduce the workload on the heart and help it to beat more regularly",
    dose: "500mg",
  ),
  Drug(
    brandName: "VoSpire ER",
    genericName: "albuterol",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_7542.jpg",
    summary:
        "It helps open up the airways in your lungs to make it easier to breathe",
    dose: "500mg",
  ),
  Drug(
    brandName: "Ibuprofen IB",
    genericName: "ibuprofen",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_14836.jpg",
    summary:
        "It is used for dental pain, fever, headaches or migraines, osteoarthritis, rheumatoid arthritis, or painful monthly periods",
    dose: "500mg",
  ),
  Drug(
    brandName: "Doxycycline Hyc DR",
    dose: "500mg",
    genericName: "doxycycline",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_16882.jpg",
    summary: "It kills certain bacteria or stops their growth",
  ),
  Drug(
    brandName: "Glucophage XR",
    genericName: "metformin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_5065.jpg",
    summary: "It is used to treat type 2 diabetes",
  ),
  Drug(
    brandName: "Lasix",
    dose: "500mg",
    genericName: "furosemide",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_7316.jpg",
    summary:
        "It helps you make more urine and to lose salt and excess water from your body",
  ),
  Drug(
    brandName: "Amoxicillin Tablet",
    genericName: "amoxicillin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_15629.jpg",
    summary: "It is used to treat certain kinds of bacterial infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "Keftab",
    genericName: "cephalexin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_5100.jpg",
    summary:
        "It is used to treat certain kinds of bacterial infections It will not work for colds, flu, or other viral infections",
    dose: "500mg",
  ),
  Drug(
    brandName: "Levothyroxine 88mcg",
    genericName: "levothyroxine",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_4317.jpg",
    summary:
        "This medicine can improve symptoms of thyroid deficiency such as slow speech, lack of energy, weight gain, hair loss, dry skin, and feeling cold",
    dose: "500mg",
  ),
  Drug(
    brandName: "Lisinopril",
    genericName: "lisinopril",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_11701.jpg",
    summary:
        "This medicine is used to treat high blood pressure and heart failure",
    dose: "500mg",
  ),
  Drug(
    brandName: "Simvastatin",
    genericName: "simvastatin",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_12959.jpg",
    summary:
        "It lowers the level of cholesterol and triglycerides in the blood",
    dose: "500mg",
  ),
  Drug(
    brandName: "Caromega",
    genericName: "multivitamin with iron",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_7472.jpg",
    summary:
        "MULTIVITAMIN with MINERAL and IRON combinations are used to help provide provide good nutrition.",
    dose: "500mg",
  ),
  Drug(
    brandName: "Hyoscyamine",
    genericName: "hyoscyamine",
    imageUrl: "https://healthtools.aarp.org/images/gold/DrugItem_4331.jpg",
    summary: "It is used to treat stomach and bladder problems",
    dose: "500mg",
  ),
]..sort((Drug a, Drug b) => a.brandName.compareTo(b.brandName)));
