import 'package:e_commerce/core/texts.dart';
import 'package:e_commerce/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: 398.w,
      height: 200.h,
      initialPage: 0,
      indicatorColor: MyColors.primaryColor,indicatorBottomPadding: 8.h,
      indicatorBackgroundColor: Colors.grey,
      children: [
        Image.asset(
          MyTexts.sliderImage,
          fit: BoxFit.cover,
        ),
        Image.asset(
          MyTexts.sliderImage2,
          fit: BoxFit.cover,
        ),
        Image.asset(
          MyTexts.sliderImage3,
          fit: BoxFit.cover,
        ),
      ],
      autoPlayInterval: 3000,
      isLoop: true,
    );
  }
}
