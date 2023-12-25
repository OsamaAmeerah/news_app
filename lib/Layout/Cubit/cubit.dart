import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/Cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sport_screen.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import '../../network/remote/dio_helper.dart';

// ignore: camel_case_types
class NewsCubit extends Cubit<NewsStates>{

NewsCubit() : super(NewsInitialState());

static NewsCubit get(context) => BlocProvider.of(context);

int currentIndex = 0;

List<BottomNavigationBarItem> bottomItems = [
const BottomNavigationBarItem(
    icon: Icon(Icons.business),
  label: 'Business ',

),
const BottomNavigationBarItem(
    icon: Icon(Icons.sports),
  label: 'Sports',
),
const BottomNavigationBarItem(
    icon: Icon(Icons.science),
  label: 'Science',
),
];


List<Widget> screen = [
  const BusinessScreen(),
  const SportScreen(),
  const ScienceScreen(),
];


void changeBottomNavBar(int index)
{
  currentIndex = index;
  if(index == 1)
    getSports();
  if(index == 2)
getScience();
  emit(NewsBottomNavState());
}


List<dynamic> business = [];
void getBusiness()
{
emit(NewsBusinessLoadingState());
  DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
      'country' : 'us',
      'category':'business',
      'apiKey' : '0c8961826bfa446db35552544eb5113b',


    },).then((value) {
    // print(value.data['articles'] [0] ['title']);
    business = value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccsessState());
  }).catchError((error){
    print(error.toString());
emit(NewsGetBusinessErrorState(error.toString()));
  });
}

List<dynamic> sports = [];
void getSports()
{
  emit(NewsSportsLoadingState());
    if(sports.length == 0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'us',
            'category':'sports',
            'apiKey' : '0c8961826bfa446db35552544eb5113b',


          },).then((value) {
          // print(value.data['articles'] [0] ['title']);
          sports = value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccsessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });

      }
    else {
      emit(NewsGetSportsSuccsessState());
    }
  
}

List<dynamic> science = [];
void getScience()
{
  emit(NewsScienceLoadingState());

  if(science.length == 0) {
    DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
      'country' : 'us',
      'category':'science',
      'apiKey' : '0c8961826bfa446db35552544eb5113b',


    },).then((value) {
    science = value.data['articles'];
    print(science[0]['title']);
    emit(NewsGetScienceSuccsessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetScienceErrorState(error.toString()));
  });
  }
}

List<dynamic> search = [];
void getSearch(String value)
{
  emit(NewsSearchLoadingState());

  DioHelper.getData(
    url: 'v2/everything',
    query: {
      'q':value,
      'apiKey' : '0c8961826bfa446db35552544eb5113b',
    },).then((value) {
    search = value.data['articles'];
    print(search[0]['title']);
    emit(NewsGetSearchSuccsessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetSearchErrorState(error.toString()));
  });
}

bool iconBool = false;
bool isDark = true;

void changeAppMode({bool? fromShared})
{

  if(fromShared != null)
  {

    isDark = fromShared;
    emit(AppChangeModeState());

  }
  else
    {
      isDark = !isDark;

      CacheHelper.putBoolean(key:'isDark', value: isDark).then((value) {

        emit(AppChangeModeState());

      });
      }

}


}