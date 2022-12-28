
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function icon;
  final Function onTap;
  final Duration eventDuration;
  final bool isDetailsPage;
  final bool isFlash;
  final Align align;
  CustomTextButton({@required this.title,this.icon, this.onTap, this.eventDuration, this.isDetailsPage, this.isFlash = false,this.align});

  @override
  Widget build(BuildContext context) {

    return Container(
      // decoration: isFlash? BoxDecoration(
      //   borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
      //   color: Theme.of(context).primaryColor.withOpacity(.05),
      // ):null,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? InkWell(
                onTap: icon,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:  SvgPicture.asset(
                    Images.filter_image,
                    height: Dimensions.ICON_SIZE_DEFAULT,
                    width: Dimensions.ICON_SIZE_DEFAULT,
                    color: ColorResources.getPrimary(context),
                  ),
                )
            )
                : SizedBox.shrink(),
            //
            // onTap != null && isFlash?
            // InkWell(
            //   onTap: onTap,
            //   child: Stack(
            //     children: [
            //       Container(
            //         width: MediaQuery.of(context).size.width/8,height: MediaQuery.of(context).size.width/6.5,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            //                 bottomRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
            //             color: Theme.of(context).primaryColor.withOpacity(.3)
            //         ),
            //       ),
            //       Positioned(left: 12,right: 12,top: 18,bottom: 18,
            //         child: Container(
            //             width: 20,height: 20,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(Radius.circular(25)),
            //                 color: Theme.of(context).primaryColor
            //             ),
            //             child: Icon(Icons.arrow_forward_outlined, size: 15, color: Theme.of(context).cardColor,)),
            //       ),
            //     ],
            //   ),
            // ) :onTap != null && !isFlash ?
            InkWell(
              onTap: onTap,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isDetailsPage == null
                        ? Text(getTranslated('VIEW_ALL_CATEGORY', context),
                        style: titilliumRegular.copyWith(
                          color: ColorResources.getArrowButtonColor(context),
                          fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        ))
                        : SizedBox.shrink(),
                    Icon(Icons.arrow_forward_ios_outlined,
                      color: isDetailsPage == null ? ColorResources.getArrowButtonColor(context) : Theme.of(context).hintColor,
                      size: Dimensions.FONT_SIZE_DEFAULT,
                    ),
                  ]),
            )
          ]),
    );
  }
}

class TimerBox extends StatelessWidget {
  final int time;
  final bool isBorder;
  final String day;

  TimerBox({@required this.time, this.isBorder = false, this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/9.5,height: MediaQuery.of(context).size.width/9.5,
      decoration: BoxDecoration(
        color: isBorder ? null : ColorResources.getPrimary(context),
        border: isBorder ? Border.all(width: 2, color: ColorResources.getPrimary(context)) : null,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(time < 10 ? '0$time' : time.toString(),
              style: robotoRegular.copyWith(
                color: isBorder ? ColorResources.getPrimary(context) : Theme.of(context).highlightColor,
                fontSize: Dimensions.FONT_SIZE_SMALL,
              ),
            ),
            Text(day, style: titilliumRegular.copyWith(color: isBorder ?
            ColorResources.getPrimary(context) : Theme.of(context).highlightColor,
              fontSize: Dimensions.FONT_SIZE_SMALL,)),
          ],
        ),
      ),
    );
  }
}
