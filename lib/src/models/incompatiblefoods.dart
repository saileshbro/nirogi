class IncompatibleFoods {
  String foodName;
  List<String> incompatibleFoods;
  IncompatibleFoods({this.foodName, this.incompatibleFoods});
}

List<IncompatibleFoods> foodData = [
  IncompatibleFoods(
    foodName: 'Banana',
    incompatibleFoods: ['Papaya','Milk','Tarul','Guava'],
  ),
  IncompatibleFoods(
    foodName: 'Beans',
    incompatibleFoods: ['Cheese', 'Eggs','Fruit','Fish','Milk','Meat','Yogurt'],
  ),
  
  IncompatibleFoods(
    foodName: 'Cheese',
    incompatibleFoods: ['Beans','Bread', 'Eggs','Fruits','Hot Drinks','Meat','Milk','Tomato','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Eggs',
    incompatibleFoods: ['Beans', 'Cheese','Fish','Hot Drinks','Meat','Melons','Milk','Potato','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Fish',
    incompatibleFoods: ['Beans','Eggs','Milk','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Hot Drinks',
    incompatibleFoods: ['Cheese','Fish','Meat','Mangoes','Milk','Starch','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Lemons',
    incompatibleFoods: ['Cucumber', 'Tomato','Milk','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Meat',
    incompatibleFoods: ['Beans','Cheese', 'Hot Drinks','Milk','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Melons',
    incompatibleFoods: ['Dairy Products','Eggs', 'Fried Foods','Grains','Milk','And Everything'],
  ),
  IncompatibleFoods(
    foodName: 'Milk',
    incompatibleFoods: ['Banana','Cherries', 'Eggs','Fruit','Fish','Hot Drinks','Meat','Melons','Orange Juice','Sour Fruits','Kitchari','Yogurt'],
  ),
  IncompatibleFoods(
    foodName: 'Mint',
    incompatibleFoods: ['Aerated Drinks'],
  ),
  IncompatibleFoods(
    foodName: 'Tapioca',
    incompatibleFoods: ['Beans','Banana','Fruit','Jaggary','Mango','Raisins'],
  ),
  IncompatibleFoods(
    foodName: 'Tomato',
    incompatibleFoods: ['Cucumber','Cheese'],
  ),
  IncompatibleFoods(
    foodName: 'Yogurt',
    incompatibleFoods: ['Cheese', 'Eggs','Fruits','Fish','Hot Drinks','Meat','Milk','Lemons'],
  ),
];
