import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/provider/category_provider.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/category/all_category_screen.dart';
import 'package:ecom_ukrbd/view/screen/category/all_category_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_widget.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

import 'category_shimmer.dart';

class CategoryViewUkrbd extends StatefulWidget {
  final bool isHomePage;
  CategoryViewUkrbd({@required this.isHomePage});

  @override
  State<CategoryViewUkrbd> createState() => _CategoryViewUkrbdState();
}

class _CategoryViewUkrbdState extends State<CategoryViewUkrbd> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProviderUkrbd>(
      builder: (context, categoryProvider, child) {

        return categoryProvider.categoryList.length != 0 ?
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: (1/1.4),
          ),
          itemCount: widget.isHomePage
              ? categoryProvider.categoryList.length > 8
              ? 8
              : categoryProvider.categoryList.length
              : categoryProvider.categoryList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {

            return InkWell(
              onTap: () {

                Provider.of<CategoryProviderUkrbd>(context, listen: false).changeSelectedIndex(index);
                Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreenUkrbd()));

              },
              child: CategoryWidgetUkrbd(category: categoryProvider.categoryList[index]),
            );

          },
        )

            : CategoryShimmer();

      },
    );
  }
}



