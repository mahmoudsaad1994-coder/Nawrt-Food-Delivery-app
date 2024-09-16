class FoodEntity {
  int foodID;
  String foodName;
  String foodDescreption;
  String foodImage;
  int foodPrice;
  int? foodofferPrice;
  String? foodofferdescrption;
  FoodEntity({
    required this.foodID,
    required this.foodName,
    required this.foodDescreption,
    required this.foodImage,
    required this.foodPrice,
    this.foodofferPrice,
    this.foodofferdescrption,
  });
}
