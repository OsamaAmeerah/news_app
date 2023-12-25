import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/webView/webView_screen.dart';

Widget buildArticleItem(article , context )=> InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), //الكيرفات بتغيروا
              image: DecorationImage(
                    image: CachedNetworkImageProvider('${article['urlToImage']}',
                 ),
                  fit: BoxFit.cover, //بغير حجم الصورة
                  ),
              ),
        ),
        const SizedBox(width: 20.0,),
         Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    ('${article['title']}'),
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  ('${article['publishedAt']}'),
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
  
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);


Widget myDivider() => Padding(
  padding:  const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget articleBuilder(list , context, {isSearch = false}) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context , index) =>buildArticleItem(list[index] , context),
    separatorBuilder:(context , index) =>myDivider() ,
    itemCount: 10,
  ),
  fallback: (context) => isSearch ? Container() : const Center(child: CircularProgressIndicator()),


);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
  required String label,
  bool isClickable = true,
  IconData? prefix,
  IconData? suffix,
  required dynamic validate,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPassword,
      enabled: isClickable,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: Icon(suffix),
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo (context , widget) => Navigator.push(
    context, MaterialPageRoute
  (

  builder: (context) =>  widget,

),
);