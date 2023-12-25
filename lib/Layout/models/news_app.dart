import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/cubit.dart';
import 'package:newsapp/Layout/Cubit/states.dart';
import 'package:newsapp/components/default_component.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/shared/cubit/appcubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context )=>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state)=> {},
       builder: (context , state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {

                    navigateTo(context, SearchScreen(),);


                  },
                ),

                IconButton(
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                  ),
                  onPressed: () {


                    AppCubit.get(context).changeAppMode();



                  },
                ),

              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
       },


      ),
    );

  }
}
