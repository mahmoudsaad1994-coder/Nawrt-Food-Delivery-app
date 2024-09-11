import 'core/utils/assets.dart';
import 'core/widgets/food_item.dart';
import 'core/widgets/food_item_with_offer.dart';
import 'features/food_categorys/views/widgets/category_item.dart';

class Categorys {
  int id;
  String categoryName;
  String categoryImage;
  Categorys({
    required this.id,
    required this.categoryImage,
    required this.categoryName,
  });
}

List<Categorys> homeCategorysList = [
  Categorys(
      id: 1, categoryName: 'باستا', categoryImage: AssetsData.testPastaImage),
  Categorys(
      id: 1, categoryName: 'برجر', categoryImage: AssetsData.testtest1Image),
  Categorys(
      id: 1, categoryName: 'برجر', categoryImage: AssetsData.testtest2Image),
  Categorys(id: 1, categoryName: 'برجر', categoryImage: AssetsData.cat_1Image),
  Categorys(id: 1, categoryName: 'باستا', categoryImage: AssetsData.cat_2Image),
  Categorys(id: 1, categoryName: 'باستا', categoryImage: AssetsData.cat_3Image),
];

List<CategoryItem> categorysList = [
  const CategoryItem(categoryName: 'بيتزا', image: AssetsData.cat_1Image),
  const CategoryItem(categoryName: 'مشويات', image: AssetsData.cat_2Image),
  const CategoryItem(categoryName: 'برجر', image: AssetsData.cat_3Image),
  const CategoryItem(categoryName: 'بيتزا', image: AssetsData.cat_1Image),
  const CategoryItem(categoryName: 'برجر', image: AssetsData.cat_2Image),
  const CategoryItem(categoryName: 'برجر', image: AssetsData.cat_2Image),
  const CategoryItem(categoryName: 'بيتزا', image: AssetsData.cat_3Image),
  const CategoryItem(categoryName: 'مشويات', image: AssetsData.cat_1Image),
  const CategoryItem(categoryName: 'مشويات', image: AssetsData.cat_1Image),
  const CategoryItem(categoryName: 'مشويات', image: AssetsData.cat_1Image),
];

List<FooditemWidget> fooditemWidgetList = [
  const FooditemWidget(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية ',
    price: 200,
    image: AssetsData.testPastaImage,
  ),
  const FooditemWidget(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية ',
    price: 150,
    image: AssetsData.testtest1Image,
  ),
  const FooditemWidget(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية ',
    price: 300,
    image: AssetsData.testtest3Image,
  ),
  const FooditemWidget(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية ',
    price: 125,
    image: AssetsData.testtest2Image,
  ),
];

List<FoodItemWithOffer> foodItemsWithOffers = [
  const FoodItemWithOffer(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطاليةايطاليةايطاليةايطاليةايطاليةايطالية',
    price: 300,
    priceAfterOffer: 150,
    image: AssetsData.testtest4Image,
    offer: '%خصم 50',
  ),
  const FoodItemWithOffer(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية',
    price: 500,
    priceAfterOffer: 250,
    image: AssetsData.testtest4Image,
    offer: '%خصم 50',
  ),
  const FoodItemWithOffer(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية',
    price: 12,
    priceAfterOffer: 200,
    image: AssetsData.testtest4Image,
    offer: 'خصم 80جنية',
  ),
  const FoodItemWithOffer(
    foodName: 'بيتزا ايطالية',
    description: 'بيتزا ايطالية',
    price: 300,
    priceAfterOffer: 150,
    image: AssetsData.testtest4Image,
    offer: '%خصم 50',
  ),
];

final List recentSearchs = [
  'كفتة مشوية',
  'تشيز برجر لحم',
  'كفتة مشوية',
  'باستا',
  'بيتزا تشيكن رانش',
];

final List cartList = [];
