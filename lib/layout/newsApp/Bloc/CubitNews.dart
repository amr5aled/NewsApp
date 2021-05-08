import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/busines/business.dart';
import 'package:newsapp/modules/science/science.dart';
import 'package:newsapp/modules/sports/sports.dart';
import 'package:newsapp/shared/components/constaint.dart';
import 'package:newsapp/shared/network/remote/cacheHelper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import 'NewsState.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialNewsState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  List<Widget> modules = [
    BusinessNews(),
    SportNews(),
    ScienceNews(),
  ];
  List<String> names = [
    'BusinessNews',
    'SportNews',
    ' ScienceNews',
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_esports), label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'science'),
  ];
  void changeindex(int index) {
    currentindex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(ChangeBottomNavState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.length == 0) {
      DioHelper.getdata(url:'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': api_key,
      }).then((value) {
        print(value.data['articles'][1]['title'].toString());
        business = value.data['articles'];
        emit(NewsGetBusinessSucessState());
      }).catchError((error) {
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSucessState());
    }
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getdata(url: method, query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': api_key,
      }).then((value) {
        print(value.data['articles'][0]['title'].toString());
        sports = value.data['articles'];
        emit(NewsGetSportsSucessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error));
      });
    } else {
      emit(NewsGetSportsSucessState());
    }
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getdata(url: method, query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': api_key,
      }).then((value) {
        print(value.data['articles'][0]['title'].toString());
        science = value.data['articles'];
        emit(NewsGetScienceSucessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error));
      });
    } else {
      emit(NewsGetScienceSucessState());
    }
  }

  bool isdark = false;
  void changeTheme({bool format}) {
    if (format != null) {
      isdark = format;
      emit(NewsThemeModeState());
    } else {
      isdark = !isdark;
      CacheHelper.putBolean(key: 'isdark', value: isdark).then((value) {
        emit(NewsThemeModeState());
      });
    }
  }

  void getSearch({@required String value}) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getdata(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'q': '$value',
      'apiKey': api_key,
    }).then((value) {
      search = value.data['articles'];
      print(value.data['articles']);
      emit(NewsGetSearchSucessState());
    }).catchError((error) {
      emit(NewsGetSearcheErrorState(error));
    });
  }
}
