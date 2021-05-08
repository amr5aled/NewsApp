import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/Bloc/CubitNews.dart';
import 'package:newsapp/layout/newsApp/Bloc/NewsState.dart';
import 'package:newsapp/shared/components/component.dart';

class ScienceNews extends StatelessWidget {
  const ScienceNews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, NewsState state) {},
        builder: (context, NewsState state) {
          var tasks = NewsCubit.get(context).science;
          return buildNews(tasks,context);
        });
  }
}