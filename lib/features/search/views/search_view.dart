import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/search_cubit.dart';
import '../manager/search_states.dart';
import 'no_result.dart';
import 'search_home_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SearchCubit.get(context);
            return SafeArea(
              child: cubit.showSearchHome
                  ? SearchHomeBody(
                      cubit: cubit,
                    )
                  : const NoResult(),
            );
          },
        ),
      ),
    );
  }
}
