import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Layout/Cubit/cubit.dart';
import '../../Layout/Cubit/states.dart';
import '../../components/default_component.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsStates>(
      listener: (context , state) {} ,
      builder: (context , state) {
        var list = NewsCubit.get(context).sports;

        return articleBuilder(list , context);
      },

    );
  }
}
