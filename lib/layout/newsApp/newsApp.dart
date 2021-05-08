import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search/search.dart';
import 'package:newsapp/shared/components/component.dart';
import 'Bloc/CubitNews.dart';
import 'Bloc/NewsState.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, NewsState state) {},
      builder: (context, NewsState state) {
        NewsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.names[cubit.currentindex]),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {
                navigateto(context,SearchNews());
              }),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  cubit.changeTheme();
                },
              )
            ],
          ),
          body: cubit.modules[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            items: cubit.items,
            onTap: (index) {
              cubit.changeindex(index);
            },
          ),
        );
      },
    );
  }
}
