// import 'package:flutter/material.dart';
// import 'package:ecom_ukrbd/data/model/response/review_model.dart';
//
// import 'package:ecom_ukrbd/localization/language_constrants.dart';
// import 'package:ecom_ukrbd/utill/custom_themes.dart';
// import 'package:ecom_ukrbd/utill/dimensions.dart';
// import 'package:ecom_ukrbd/view/basewidget/custom_app_bar.dart';
// import 'package:ecom_ukrbd/view/screen/product/widget/review_widget.dart';
//
// class ReviewScreen extends StatelessWidget {
//   final List<ReviewModel> reviewList;
//   ReviewScreen({this.reviewList});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//         CustomAppBar(title: getTranslated('reviews', context)),
//
//         Padding(
//           padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//           child: Text(getTranslated('reviews', context)+'(${reviewList.length})', style: robotoBold),
//         ),
//
//         Expanded(child: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//           itemCount: reviewList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
//               padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
//               color: Theme.of(context).highlightColor,
//               child: ReviewWidget(reviewModel: reviewList[index]),
//             );
//           },
//         )),
//
//       ]),
//     );
//   }
// }
