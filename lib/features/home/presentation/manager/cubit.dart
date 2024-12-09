import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

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
    CategoriesEntity(id: 1, name: 'باستا', image: AssetsData.cat_2Image),
    CategoriesEntity(id: 1, name: 'برجر', image: AssetsData.cat_3Image),
    CategoriesEntity(id: 1, name: 'بيتزا', image: AssetsData.cat_1Image),
    CategoriesEntity(id: 1, name: 'معكرونه', image: AssetsData.cat_1Image),
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
        '150': 200,
        '200': 400,
      },
      sizesAndPriceafterOffer: {
        '150': 150,
        '200': 350,
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
        '150': 300,
        '200': 350,
      },
      sizesAndPriceafterOffer: {
        '150': 250,
        '200': 300,
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

  List<Map<String, int>> foodAdditionsList = [
    {'إضافة خس': 20},
    {'إضافة جزر': 10},
    {'إضافة جزر': 10},
  ];
//shopping cart items
  List<Map<String, dynamic>> cartItems = [
    {"name": "بيتزا إيطالية", "price": 150, "quantity": 1},
    {"name": "بيتزا مصريه", "price": 120, "quantity": 1},
    {"name": "بيتزا فرنسيه", "price": 250, "quantity": 1},
    {"name": "بيتزا إيطالية", "price": 150, "quantity": 1},
    {"name": "بيتزا مصريه", "price": 120, "quantity": 1},
    {"name": "بيتزا فرنسيه", "price": 250, "quantity": 1},
  ];
  double discount = 0;

  void applyDiscount() {
    discount = 30; // مثال: خصم ثابت بقيمة 30 جنيه.
    emit(ApplyDiscountStates());
  }

  void addFoodItem(int quantity) {
    quantity++;
    emit(AddFoodItemCountStates());
  }

  void oddFoodItem(int quantity) {
    if (quantity > 1) {
      quantity--;
      emit(OddFoodItemCountStates());
    }
  }

  //checkBox additions
  int additionChecked = 0;
  late List<bool> isAdditionChecked =
      List.generate(foodAdditionsList.length, (index) => false);
  selectAdition(index, value) {
    isAdditionChecked[index] = value ?? false;
    if (value) {
      additionChecked = additionChecked + foodAdditionsList[index].values.first;
    } else {
      additionChecked = additionChecked - foodAdditionsList[index].values.first;
    }
    gettotalPrice(
      foodSize: selectedSize ?? '',
      newselectedPrice: selectedPrice ?? 0,
      newselectedPriceOffer: selectedPriceWithOffer,
      isOffer: selectedPriceWithOffer != null,
    );
    emit(AdditionCheckState());
  }

  // price and sizes price for meal
  String? selectedSize;
  int? selectedPrice;
  int? selectedPriceWithOffer;

  changePriceAndSize(food,
      {required String foodSize, required int newselectedPrice}) {
    selectedSize = foodSize;
    selectedPrice = newselectedPrice;
    gettotalPrice(
      foodSize: foodSize,
      isOffer: false,
      newselectedPrice: newselectedPrice,
    );
    emit(ChangeSizeAndPriceState());
  }

  changePriceAndSizeWithOffer({
    required String foodSize,
    required int newselectedPrice,
    required int newselectedPriceWithOffer,
  }) {
    selectedSize = foodSize;
    selectedPrice = newselectedPrice;
    selectedPriceWithOffer = newselectedPriceWithOffer;
    gettotalPrice(
      foodSize: foodSize,
      isOffer: true,
      newselectedPrice: newselectedPrice,
      newselectedPriceOffer: newselectedPriceWithOffer,
    );
    emit(ChangeSizeAndPriceState());
  }

//total price
  int totalPriceForMeal = 0;
  gettotalPrice(
      {required String foodSize,
      required int newselectedPrice,
      int? newselectedPriceOffer,
      required bool isOffer}) {
    selectedSize = foodSize;
    selectedPrice = newselectedPrice;
    if (isOffer) {
      selectedPriceWithOffer = newselectedPriceOffer;
      totalPriceForMeal = additionChecked + selectedPriceWithOffer!.toInt();
    } else {
      totalPriceForMeal = additionChecked + selectedPrice!.toInt();
    }
    emit(GetTotalPriceState());
  }

  //reset prices and sizes
  resetPriceAndSize() {
    selectedSize = null;
    selectedPriceWithOffer = null;
    selectedPrice = null;
    isAdditionChecked =
        List.generate(foodAdditionsList.length, (index) => false);
    totalPriceForMeal = 0;
    additionChecked = 0;
    emit(ResetSizeAndPriceState());
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

  //home offer slider
  int selectedPageIndex = 0;
  changeIndexSlider(int index) {
    selectedPageIndex = index;
    emit(ChangeIndexSliderState());
  }

  //payment
  bool isCashOnDeliverySelected = false;
  changeDeliverySelected(bool value) {
    isCashOnDeliverySelected = value;
    emit(ChangeDeliveryState());
  }

  bool saveWalletInfo = false;
  toggleSaveWalletInfo(bool value) {
    saveWalletInfo = !saveWalletInfo;
    emit(ChangeSaveWalletInfoState());
  }

  //pickup branch
  List<String> branchs = [
    'فرع الرحاب',
    'فرع الشرقيه',
    'فرع المنصورة',
    'فرع طلخا',
  ];
  String branchSelected = "اختر الفرع المراد الاستلام منه";
  changebranchSelected(String value) {
    branchSelected = value;
    emit(ChangeBranchSelectedState());
  }

  //pickup date
  String? pickupTimeAndDate;
  String pickupTime = 'وقت الاستلام';
  changePickupTime(String value) {
    pickupTime = value;
    if (value == 'استلام سريع') {
      pickupTimeAndDate = 'استلام سريع';
    }
    emit(ChangePickupTimeState());
  }

  String formattedDate = DateFormat('EEEE, yyyy-MM-dd hh:mm a', 'ar')
      .format(DateTime.now().add(const Duration(hours: 1)));

  Future<void> selectPickupTimeDate(BuildContext context) async {
    DateTime dateTime = await showOmniDateTimePicker(context: context) ??
        DateTime.now().add(const Duration(hours: 1));
    formattedDate =
        DateFormat('EEEE, yyyy-MM-dd hh:mm a', 'ar').format(dateTime);
    pickupTimeAndDate = 'الاستلام يوم $formattedDate';
    emit(ChangePickupTimeState());
  }

  //order info

  final List<Map<String, dynamic>> orderDeliverySteps = [
    {
      "title": "تأكيد الطلب",
      "description": "تم تأكيد استلام طلبك من المطعم",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.done,
    },
    {
      "title": "تحضير الطلب",
      "description": "طلبك في مرحلة التحضير",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.done,
    },
    {
      "title": "الطلب جاهز للتسليم",
      "description": "تم تحضير الطلب وفي انتظار الاستلام",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.inProcess,
    },
    {
      "title": "تسليم الطلب",
      "description": "تم تسليم الطلب للمندوب",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.pending,
    },
    {
      "title": "توصيل الطلب",
      "description": "الطلب في طريقه إليك بواسطة:",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.pending,
    },
  ];

  final List<Map<String, dynamic>> orderBranchSteps = [
    {
      "title": "تأكيد الطلب",
      "description": "تم تأكيد استلام طلبك من المطعم",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.done,
    },
    {
      "title": "تحضير الطلب",
      "description": "طلبك في مرحلة التحضير",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.inProcess,
    },
    {
      "title": "الطلب جاهز للتسليم",
      "description": "تم تحضير الطلب وفي انتظار الاستلام",
      "time": "9:25 صباحًا",
      "orderStatus": OrderStatus.pending,
    },
  ];

  double get totalPrice => cartItems.fold(
      0, (total, item) => total + item["price"] * item["quantity"]);

  double get finalPrice => totalPrice - discount;
}

enum OrderStatus {
  done, // مكتملة
  inProcess, // تحت التحضير
  pending, // لم تبدأ بعد
}
