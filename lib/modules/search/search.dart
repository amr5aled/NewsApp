
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/Bloc/CubitNews.dart';
import 'package:newsapp/layout/newsApp/Bloc/NewsState.dart';
import 'package:newsapp/shared/components/component.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller=TextEditingController();
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, NewsState state) {},
        builder: (context, NewsState state) {
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: defaultTextField(
                      controller:searchcontroller,
                      label: 'Search',
                      icon: Icons.search,
                      onChange: (value)
                      {
                        NewsCubit.get(context).getSearch(value: value);

                      }
                  ),
                ),
                Expanded(child: buildNews(list, context,is_sesearch: true))
                

              ],
            ),
          );
          
        });
    
  }
}
