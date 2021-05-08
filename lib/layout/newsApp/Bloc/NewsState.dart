abstract class NewsState {}

class InitialNewsState extends NewsState {}

class ChangeBottomNavState extends NewsState {}

class NewsGetBusinessLoadingState extends NewsState {}

class NewsGetBusinessSucessState extends NewsState {}

class NewsGetBusinessErrorState extends NewsState {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsState {}

class NewsGetSportsSucessState extends NewsState {}

class NewsGetSportsErrorState extends NewsState {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}

class NewsGetScienceSucessState extends NewsState {}

class NewsGetScienceErrorState extends NewsState {
  final String error;

  NewsGetScienceErrorState(this.error);
}
class NewsThemeModeState extends NewsState {}
class NewsGetSearchLoadingState extends NewsState {}

class NewsGetSearchSucessState extends NewsState {}

class NewsGetSearcheErrorState extends NewsState {
  final String error;

  NewsGetSearcheErrorState(this.error);
}