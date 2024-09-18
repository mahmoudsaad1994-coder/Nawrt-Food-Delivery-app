class FoodEntity {
  int foodID;
  String foodName;
  String foodDescreption;
  String foodImage;
  String? foodofferdescrption;
  Map<String, int> sizesAndPrice;
  Map<String, int>? sizesAndPriceafterOffer;

  FoodEntity({
    required this.foodID,
    required this.foodName,
    required this.foodDescreption,
    required this.foodImage,
    required this.sizesAndPrice,
    this.sizesAndPriceafterOffer,
    this.foodofferdescrption,
  });
}
