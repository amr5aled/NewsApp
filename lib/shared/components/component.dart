import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/webView/webView.dart';

Widget BuildList(article, context) {
  return InkWell(
    onTap: ()=>
        navigateto(context,WebNews(article['url']),),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        '${article['urlToImage']}',
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${article['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildNews(list, context,{is_sesearch=false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildList(list[index], context),
          separatorBuilder: (context, index) => Divider(),
          itemCount: list.length);
    },
    fallback: (context) =>is_sesearch?Container(): Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void navigateto(context, Widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Widget));
}

Widget defaultTextField({
  TextEditingController controller,
  String label,
  IconData icon,
  Function onChange,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(),
    ),
    onChanged: onChange,
  );
}
