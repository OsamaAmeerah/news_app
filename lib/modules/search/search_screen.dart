import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/components/default_component.dart';


import '../../Layout/Cubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {

   SearchScreen({super.key});
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>
      (
      listener: (context , state) {},
      builder: (context,state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(


          ),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value){
                     NewsCubit.get(context).getSearch(value);


                  },
                  label: 'Search',
                  validate: (String? value){
                    if(value!.isEmpty){
                      return'Search Must not be empty';

                    }
                    return null;

                  },
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: articleBuilder(list, context , isSearch: true)),


            ],

          ),

        );

      },
    );
  }
}
