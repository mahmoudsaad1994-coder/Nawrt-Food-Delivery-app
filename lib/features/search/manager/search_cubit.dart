import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchStatesInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  bool showItemesRatingMoreThan4 = false;
  bool showPriceWithOffer = false;

  changeBoolPriceWithOffer({required bool newValue}) {
    showPriceWithOffer = newValue;
    emit(ChangeBoolValueSearchStates());
  }

  changeBoolItemesRatingMoreThan4({required bool newValue}) {
    showItemesRatingMoreThan4 = newValue;
    emit(ChangeBoolValueSearchStates());
  }

  double startPrice = 50;
  double endPrice = 400;

  changeRangePrice({required RangeValues rangeValues}) {
    startPrice = rangeValues.start.round().toDouble();
    endPrice = rangeValues.end.round().toDouble();
    emit(ChangePriceRangeSearchStates());
  }

  bool showSearchHome = false;

  showSearchResult() {
    showSearchHome = !showSearchHome;
    emit(ChangeSearchScreenSearchStates());
  }

  final List recentSearchs = [
    'كفتة مشوية',
    'تشيز برجر لحم',
    'كفتة مشوية',
    'باستا',
    'بيتزا تشيكن رانش',
  ];

  TextEditingController searchController = TextEditingController();
}
