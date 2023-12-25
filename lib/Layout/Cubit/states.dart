// ignore: camel_case_types
abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}



class ChangeTitleNameState extends NewsStates{}

class NewsBusinessLoadingState extends NewsStates{}


class NewsGetBusinessSuccsessState extends NewsStates{}


class NewsGetBusinessErrorState extends NewsStates{

  final String error;
  NewsGetBusinessErrorState(this.error);

}

class NewsSportsLoadingState extends NewsStates{}


class NewsGetSportsSuccsessState extends NewsStates{}


class NewsGetSportsErrorState extends NewsStates{





  final String error;
  NewsGetSportsErrorState(this.error);

}

class NewsScienceLoadingState extends NewsStates{}


class NewsGetScienceSuccsessState extends NewsStates{}



class NewsGetScienceErrorState extends NewsStates{

  final String error;
  NewsGetScienceErrorState(this.error);

}

class AppChangeModeState extends NewsStates{}

class NewsSearchLoadingState extends NewsStates{}


class NewsGetSearchSuccsessState extends NewsStates{}



class NewsGetSearchErrorState extends NewsStates{

  final String error;
  NewsGetSearchErrorState(this.error);

}