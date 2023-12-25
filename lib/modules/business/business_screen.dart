import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/Layout/Cubit/states.dart';

import '../../components/default_component.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsStates>(
      listener: (context , state) {} ,
      builder: (context , state) {
        var list = NewsCubit.get(context).business;

        return articleBuilder(list , context);

      },

    );
  }
}
