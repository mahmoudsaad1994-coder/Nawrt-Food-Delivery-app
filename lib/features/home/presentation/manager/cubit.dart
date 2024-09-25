import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets.dart';
import '../../domain/entities/categoray.dart';
import '../../domain/entities/food_entity.dart';
import 'states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialMainStates());

  static MainCubit get(context) => BlocProvider.of(context);

  List<CategoriesEntity> categoriesList = [
    CategoriesEntity(id: 1, name: 'باستا', image: AssetsData.cat_1Image),
    CategoriesEntity(id: 1, name: 'برجر', image: AssetsData.cat_1Image),
    CategoriesEntity(id: 1, name: 'بيتزا', image: AssetsData.cat_3Image),
    CategoriesEntity(id: 1, name: 'معكرونه', image: AssetsData.cat_2Image),
    CategoriesEntity(id: 1, name: 'باستا', image: AssetsData.cat_2Image),
    CategoriesEntity(id: 1, name: 'برجر', image: AssetsData.cat_3Image),
    CategoriesEntity(id: 1, name: 'بيتزا', image: AssetsData.cat_1Image),
    CategoriesEntity(id: 1, name: 'معكرونه', image: AssetsData.cat_1Image),
  ];

  List<FoodEntity> foodListWithOffers = [
    FoodEntity(
      foodID: 1,
      foodName: 'بيتزا ايطالي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 2,
      foodName: 'معكرونه باللحمه',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 3,
      foodName: 'رز بسمتي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 4,
      foodName: 'بيتزا ايطالي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 5,
      foodName: 'معكرونه باللحمه',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 6,
      foodName: 'رز بسمتي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 7,
      foodName: 'بيتزا ايطالي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 8,
      foodName: 'معكرونه باللحمه',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
    FoodEntity(
      foodID: 9,
      foodName: 'رز بسمتي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.cat_1Image,
      sizesAndPrice: {
        '150': 150,
      },
      sizesAndPriceafterOffer: {
        '150': 100,
      },
      foodofferdescrption: 'عرض القطعة ب100جنية',
    ),
  ];

  List<FoodEntity> foodsList = [
    FoodEntity(
      foodID: 1,
      foodName: 'بيتزا ايطالي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {
        '150': 150,
        '200': 190,
      },
    ),
    FoodEntity(
      foodID: 2,
      foodName: 'معكرونه باللحمه',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {
        '150': 150,
        '200': 190,
        '250': 220,
      },
    ),
    FoodEntity(
      foodID: 3,
      foodName: 'رز بسمتي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {'150': 150},
    ),
    FoodEntity(
      foodID: 4,
      foodName: 'بيتزا ايطالي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {'150': 150},
    ),
    FoodEntity(
      foodID: 5,
      foodName: 'معكرونه باللحمه',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {'150': 150},
    ),
    FoodEntity(
      foodID: 6,
      foodName: 'رز بسمتي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {
        '150': 150,
        '200': 190,
      },
    ),
    FoodEntity(
      foodID: 7,
      foodName: 'بيتزا ايطالي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {'150': 150},
    ),
    FoodEntity(
      foodID: 8,
      foodName: 'معكرونه باللحمه',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {'150': 150},
    ),
    FoodEntity(
      foodID: 9,
      foodName: 'رز بسمتي',
      foodDescreption:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
      foodImage: AssetsData.testPastaImage,
      sizesAndPrice: {
        '150': 150,
        '200': 190,
      },
    ),
  ];

  List<Map<String, int>> foodAdditionsWidgetList = [
    {'إضافة خس': 20},
    {'إضافة جزر': 10},
    {'إضافة جزر': 10},
  ];
  //checkBox additions
  List<bool> isAdditionChecked = List.generate(3, (index) => false);
  selectAdition(index, value) {
    isAdditionChecked[index] = value ?? false;
    emit(AdditionCheckState());
  }

  //get price and sizes
  String? selectedSize;
  int? selectedPrice;
  changePriceAndSize(
      {required String foodSize, required int newselectedPrice}) {
    selectedSize = foodSize;
    selectedPrice = newselectedPrice;
    emit(ChangeSizeAndPriceState());
  }

  //favorite food
  List<FoodEntity> favoriteFoods = [];
  void toggleFoodFav(int foodID) {
    final existingIndex =
        favoriteFoods.indexWhere((food) => food.foodID == foodID);
    if (existingIndex >= 0) {
      favoriteFoods.removeAt(existingIndex);
    } else {
      favoriteFoods.add(foodsList.firstWhere((food) => food.foodID == foodID));
    }

    emit(ToggleFoodFav());
  }

  bool isMealFavorite(int id) {
    return favoriteFoods.any((meal) => meal.foodID == id);
  }

  int counter = 1;
  changeCounter(bool add) {
    add
        ? counter++
        : counter == 0
            ? counter == 1
            : counter--;

    emit(ChangeCounterStates());
  }

  //home offer slider
  int selectedPageIndex = 0;
  changeIndexSlider(int index) {
    selectedPageIndex = index;
    emit(ChangeIndexSliderState());
  }
}
