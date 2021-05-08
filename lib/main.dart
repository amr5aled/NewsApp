import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:newsapp/shared/components/bloc_observe.dart';
import 'package:newsapp/shared/network/remote/cacheHelper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import 'layout/newsApp/Bloc/CubitNews.dart';
import 'layout/newsApp/Bloc/NewsState.dart';
import 'layout/newsApp/newsApp.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.int();
   await CacheHelper.int();
   bool isdark=CacheHelper.getBoolean(key: 'isdark');
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  final bool isdark;
  MyApp( this.isdark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
      BlocProvider(
          create: (context) => NewsCubit()..changeTheme(format: isdark)..getBusiness()..getSports()..getScience()),
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
      listener: (context, NewsState state) {},
      builder: (context, NewsState state) {
      NewsCubit cubit = BlocProvider.of(context);
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.grey,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme:
                IconThemeData(color: Colors.black, size: 12, opacity: 1)),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
                selectedLabelStyle: TextStyle(fontSize: 14.0),
                type: BottomNavigationBarType.fixed //fixed width//
            ),
            textTheme: TextTheme(
        bodyText1: TextStyle(
        color: Colors.black,
            fontWeight: FontWeight.w500
        )
      )

        ),
        darkTheme:  ThemeData(
            appBarTheme: AppBarTheme(
                color: HexColor('333739'),
                elevation: 0.0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.grey,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme:
                IconThemeData(color: Colors.black, size: 12, opacity: 1)),
            scaffoldBackgroundColor: HexColor('333739'),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: HexColor('333739'),
                selectedItemColor: Colors.grey,
                elevation: 20.0,
                selectedLabelStyle: TextStyle(fontSize: 14.0),
                type: BottomNavigationBarType.fixed //fixed width//
            ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
                  fontWeight: FontWeight.w500
            )
          )
        ),
        themeMode: cubit.isdark?ThemeMode.dark:ThemeMode.light,
        home: NewsApp(),
      );
      }));



  }


}
