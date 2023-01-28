import 'package:flutter/material.dart';

import '../../../data/model/response/ukrbd/produuct_model.dart';

import '../../basewidget/search_product_widget_ukrbd.dart';

///

// class SearchScreen extends StatefulWidget {
//   static const String routeName = "/searchScreen";
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//
//
//   final searchedCities = ['Hetauda', 'Itahari', 'Dharan'];
//
//   Icon customIcon = Icon(Icons.search,color: ColorResources.BLACK,size: 30,);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AllCategoryWiseProductProviderUkrbd>(
//         builder: (context, allCategoryWiseProductProviderUkrbd, child) {
//       List<Products> productList = allCategoryWiseProductProviderUkrbd.allCategoryWiseProductList;
//       print(productList.length);
//       return Scaffold(
//       backgroundColor: Colors.white,
//
//         appBar: AppBar(
//           elevation: 0.0,
//         backgroundColor: Colors.white,
//
//           centerTitle: true,
//          // title: customSearchBar,
//           leading: IconButton(
//             icon:  Icon(Icons.arrow_back,color:  ColorResources.BLACK,size: 30,),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//
//
//           ) ,
//
//           actions: [
//             IconButton(
//               icon: customIcon,
//               onPressed: () {
//                 showSearch(
//                     context: context,
//                     delegate: DataSearch(
//                         products: productList,
//                         recentSearches: []));
//               },
//             ),
//           ],
//         ),
//         body: Center(child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/searchicon.png',
//               height: 200,
//               width: 200,
//             ),
//             SizedBox(height: 5,),
//             Text("Search for your desired products", style: TextStyle(
//                 color: ColorResources.HINT_TEXT_COLOR,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold
//             ),),
//             SizedBox(height: 5,),
//             Text("(e.g. watch, panjabi)" ,style: TextStyle(
//                 color: ColorResources.HINT_TEXT_COLOR,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold
//             ),),
//           ],
//         ),),
//         // drawer: Drawer(),
//       );
//     });
//   }
// }

class DataSearch extends SearchDelegate<Products> {
  List<Products> products;
  List<Products> recentSearches;
  List<Products> suggestionList;

  DataSearch({this.products, this.recentSearches});

  Products result;

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar eg: cross icon
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar eg:arrow icon
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Show some result based on the selection
    print("I am pressed");
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        itemCount: (suggestionList.length),
        itemBuilder: (context, index) {
          Products product = suggestionList[index];
          return SearchProductWidgetUkrbd(
            productModel: product,
          );
        });

    //SizedBox();

    //   Center(
    //   child: Container(
    //     height: 100.0,
    //     width: 100.0,
    //     child: Card(
    //       color: Colors.red,
    //       child: Center(
    //         child: Text(""),
    //       //  child: Text(result.productName),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //INFO: Show when someone searches for something
    suggestionList = query.isEmpty
        ? recentSearches
        : products
            .where((products) => products.productName
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        itemCount: (suggestionList.length),
        itemBuilder: (context, index) {
          Products product = suggestionList[index];
          return SearchProductWidgetUkrbd(
            productModel: product,
          );
        });
  }
}
