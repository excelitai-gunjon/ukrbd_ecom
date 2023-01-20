import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/response/categories_ukrbd.dart';
class CategoryWidgetUkrbd extends StatefulWidget {
  final Categories category;
  final String categoryImage;
  final int colorCode;
  const CategoryWidgetUkrbd({Key key, @required this.category,this.categoryImage,this.colorCode}) : super(key: key);

  @override
  State<CategoryWidgetUkrbd> createState() => _CategoryWidgetUkrbdState();
}

class _CategoryWidgetUkrbdState extends State<CategoryWidgetUkrbd> {
  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Expanded(
        child: Container(
          // height: MediaQuery.of(context).size.width/5,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
            // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            borderRadius: BorderRadius.circular(2),
            // color: Theme.of(context).highlightColor,
            color: Color(widget.colorCode),
          ),
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
            borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child:
            // FadeInImage.assetNetwork(
            //   fit: BoxFit.cover,
            //   placeholder: Images.placeholder,
            //   image: category.image!=null?'${Provider.of<SplashProvider>(context,listen: false).baseUrls.categoryImageUrl}'
            //       '/${category.image}':null,
            //   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover,),
            // ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: Images.placeholder,
                    image: "assets/category/3.png",
                    imageErrorBuilder: (c, o, s) => Image.asset("${widget.categoryImage}", fit: BoxFit.cover,),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: MediaQuery.of(context).size.width*.4,
                    width: MediaQuery.of(context).size.width*.18,
                    // color: Colors.deepOrangeAccent,
                    child: Center(
                      child: Text(widget.category.category,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                        style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: ColorResources.getTextTitle(context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      // Container(
      //   child: Center(
      //     child: Text(widget.category.category,
      //       textAlign: TextAlign.center,
      //       maxLines: 1,
      //       overflow: TextOverflow.ellipsis,
      //       style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
      //           color: ColorResources.getTextTitle(context)),
      //     ),
      //   ),
      // ),

    ]);
  }
}
