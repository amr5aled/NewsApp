import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/Bloc/CubitNews.dart';
import 'package:newsapp/layout/newsApp/Bloc/NewsState.dart';
import 'package:newsapp/shared/components/component.dart';

class SportNews extends StatelessWidget {
  const SportNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, NewsState state) {},
        builder: (context, NewsState state) {
          var list = NewsCubit.get(context).sports;
          return buildNews(list,context);
        });
  }
}
