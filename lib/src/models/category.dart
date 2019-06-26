class Categories {
  List<Category> categories;

  Categories({this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Category>();
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int categoryId;
  String category;

  Category({this.categoryId, this.category});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category'] = this.category;
    return data;
  }
}

final List<Category> categories = [
  Category(categoryId: 2, category: "Body Organs"),
  Category(categoryId: 3, category: "Cardiac"),
  Category(categoryId: 4, category: "Diseases"),
  Category(categoryId: 1, category: "Allergies"),
  Category(categoryId: 5, category: "Food and Nutrition"),
  Category(categoryId: 6, category: "Infections"),
  Category(categoryId: 7, category: "Injuries and Accidents"),
  Category(categoryId: 8, category: "Medications"),
  Category(categoryId: 9, category: "Mental Health"),
  Category(categoryId: 10, category: "Others"),
  Category(categoryId: 11, category: "Pregnancy and Newborn"),
  Category(categoryId: 12, category: "Sexual Health"),
  Category(categoryId: 13, category: "Symptoms"),
]..sort((Category a, Category b) => a.category.compareTo(b.category));
