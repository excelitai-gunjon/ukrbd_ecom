import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/product_model.dart';
import 'package:ecom_ukrbd/provider/banner_provider.dart';
import 'package:ecom_ukrbd/provider/banner_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/brand_provider.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/top_seller_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen.dart';
import 'package:ecom_ukrbd/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
class BannersViewUkrbd extends StatefulWidget {

  @override
  State<BannersViewUkrbd> createState() => _BannersViewUkrbdState();
}

class _BannersViewUkrbdState extends State<BannersViewUkrbd> {


  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        //'https://ukrbd.com/images/slider_images/${bannerImage}'

        Consumer<BannerProviderUkrbd>(
          builder: (context, bannerProvider, child) {

            double _width = MediaQuery.of(context).size.width;
            return Container(
              width: _width,
              height: _width * 0.4,
              child: bannerProvider.mainBannerList != null ? bannerProvider.mainBannerList.length != 0 ? Stack(
                fit: StackFit.expand,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      onPageChanged: (index, reason) {
                        Provider.of<BannerProviderUkrbd>(context, listen: false).setCurrentIndex(index);
                      },
                    ),
                    itemCount: bannerProvider.mainBannerList.length == 0 ? 1 : bannerProvider.mainBannerList.length,
                    itemBuilder: (context, index, _) {

                      return InkWell(
                        onTap: () {
                          // _clickBannerRedirect(context,
                          //     bannerProvider.mainBannerList[index].resourceId,
                          //     bannerProvider.mainBannerList[index].resourceType =='product'?
                          //     bannerProvider.mainBannerList[index].product : null,
                          //     bannerProvider.mainBannerList[index].resourceType);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: Images.placeholder, fit: BoxFit.cover,
                              image: 'https://ukrbd.com/images/slider_images/${bannerProvider.mainBannerList[index].image}',
                              imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_3x1, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bannerProvider.mainBannerList.map((banner) {
                        int index = bannerProvider.mainBannerList.indexOf(banner);
                        return TabPageSelectorIndicator(
                          backgroundColor: index == bannerProvider.currentIndex ? Theme.of(context).primaryColor : Colors.grey,
                          borderColor: index == bannerProvider.currentIndex ? Theme.of(context).primaryColor : Colors.grey,
                          size: 10,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ) : Center(child: Text('No banner available')) : Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: bannerProvider.mainBannerList == null,
                child: Container(margin: EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorResources.WHITE,
                )),
              ),
            );
          },
        ),

        SizedBox(height: 5),
      ],
    );
  }
}

// class BannerModelClass{
//
//   List<String> bannerList=[
//     "assets/banner/1.jpg",
//     "assets/banner/2.jpg",
//     "assets/banner/3.jpg",
//     "assets/banner/4.jpg",
//     "assets/banner/5.jpg",
//     "assets/banner/6.png",
//     "assets/banner/7.jpg",
//     "assets/banner/8.jpg",
//     "assets/banner/9.jpg",
//     "assets/banner/10.jpg",
//     "assets/banner/11.jpg",
//     "assets/banner/12.jpg",
//     "assets/banner/13.jpg",
//     "assets/banner/14.jpg",
//   ];
//
// }

